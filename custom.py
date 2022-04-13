from taming.data.custom import CustomBase
from taming.data.base import ImagePaths
from pathlib import Path

class FolderData(CustomBase):
    def __init__(self, size, folder, ext="png"):
        super().__init__()
        folder = Path(folder)
        assert folder.is_dir(), f"{folder} is not directory"
        images = list(folder.rglob(f"*.{ext}"))
        assert len(images) > 0, f"No images found of type {ext}"
        images = [str(x.absolute()) for x in images]

        self.data = ImagePaths(paths=images, size=size, random_crop=False) 