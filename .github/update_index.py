import glob
import hashlib
import json


def md5(fname):
    # Calculate the MD5 checksum of a file
    # Copied from https://stackoverflow.com/a/3431838
    hash_md5 = hashlib.md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


with open("index.json", 'r', encoding="utf-8") as fileobj:
    index = json.load(fileobj)

for script_path in sorted(glob.glob("experimental/*.ps1") + glob.glob("stable/*.ps1")):
    script_path = script_path.replace("\\", "/")
    script_hash = md5(script_path)
    if script_path not in index:
        index[script_path] = [script_hash]
    elif script_hash not in index[script_path]:
        index[script_path].append(script_hash)

with open("index.json", 'w', encoding="utf-8") as fileobj:
    json.dump(index, fileobj, indent=4)
