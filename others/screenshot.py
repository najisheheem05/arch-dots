import subprocess
from argparse import Namespace
from datetime import datetime
from pathlib import Path

from caelestia.utils.notify import notify


class Command:
    args: Namespace

    def __init__(self, args: Namespace) -> None:
        self.args = args

        # Create destination directory upfront
        self.pictures_dir = Path.home() / "Pictures" / "Screenshots"
        self.pictures_dir.mkdir(parents=True, exist_ok=True)

    def _new_dest(self):
        timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
        return self.pictures_dir / f"{timestamp}.png"

    def run(self) -> None:
        if self.args.region:
            self.region()
        else:
            self.fullscreen()

    def region(self) -> None:
        dest = self._new_dest()

        if self.args.region == "slurp":
            subprocess.run(
                ["qs", "-c", "caelestia", "ipc", "call",
                 "picker", "openFreeze" if self.args.freeze else "open"]
            )
        else:
            sc_data = subprocess.check_output(
                ["grim", "-l", "0", "-g", self.args.region.strip(), "-"]
            )
            with open(dest, "wb") as f:
                f.write(sc_data)

            swappy = subprocess.Popen(
                ["swappy", "-f", dest],
                start_new_session=True
            )

        self._notify(dest)

    def fullscreen(self) -> None:
        dest = self._new_dest()

        sc_data = subprocess.check_output(["grim", "-"])
        with open(dest, "wb") as f:
            f.write(sc_data)

        subprocess.run(["wl-copy"], input=sc_data)

        self._notify(dest)

    def _notify(self, dest):
        action = notify(
            "-i",
            "image-x-generic-symbolic",
            "-h",
            f"STRING:image-path:{dest}",
            "--action=open=Open",
            "--action=save=Save",
            "Screenshot taken",
            f"Screenshot stored in {dest} and copied to clipboard",
        )

        if action == "open":
            subprocess.Popen(["swappy", "-f", dest], start_new_session=True)

        elif action == "save":
            # Already saved in the correct directory, but user asked “save” again
            saved_copy = dest.with_suffix(".png")
            saved_copy.write_bytes(dest.read_bytes())
            notify("Screenshot saved", f"Saved to {saved_copy}")
