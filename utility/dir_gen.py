import os
import sys


proj_name = sys.argv[1]


def get_items_to_gen(sufix: str) -> dict:
    return {
        "src": [f"ml_{sufix}.ipynb"],
        "output": [],
        "latex_raport": [f"ml_{sufix}.tex", f"ml_{sufix}.bib", "sprawozdanie.cls"],
    }

    # get current directory


path = os.getcwd()

path = os.path.join(path, proj_name)
print("Created:\t", path)

try:
    os.mkdir(path)
except Exception as e:
    print(e)

to_generate = get_items_to_gen(proj_name)
for folder in to_generate:
    new_path = os.path.join(path, folder)

    if not os.path.exists(new_path):
        os.mkdir(new_path)
        files_to_gen = to_generate[folder]
        for file in files_to_gen:
            new_path_to_file = os.path.join(new_path, file)
            if not os.path.exists(new_path_to_file):
                f = open(new_path_to_file, "w")
                f.close()
            else:
                print("Failed to create file! Exiting")
                exit(-1)

    else:
        print("Failed to create folder! Exiting")
        exit(-1)
