def baza_danych_projektowych_to_csv():
    import pandas as pd

    # df = pd.read_excel("../../database/BIPOL.xlsx", sheet_name="Baza")
    # # df.columns
    # df = df[["Zmienna", "Wartość", "Jednostka"]]
    # df.round({"Wartość": 2})
    # df.to_csv("../../database/plane_properties.csv", index=False)
    # Sprawdzasz ile jest kolumn z projektami
    df = pd.read_excel("../../database/ml_projekty.xlsx", sheet_name="Baza")
    proj_names = [i for i in df.columns if "Unnamed" not in i]
    proj_names_len = len(proj_names)

    # wybieranie odopwiednich kolumn
    alphabet = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z".replace(" ", "")

    start_letter = []
    stop_letter = []

    for i, letter in enumerate(alphabet):
        if (i + 1) % 3 == 1:
            start_letter.append(letter)
        elif (i + 1) % 3 == 2:
            stop_letter.append(letter)
            if len(stop_letter) == proj_names_len:
                break

    # tworzenie par kolumn do pobrania
    pairs = [f"{start}:{stop}" for start, stop in zip(start_letter, stop_letter)]

    data = {}
    for p_name, pair in zip(proj_names, pairs):
        df = pd.read_excel(
            "../../database/ml_projekty.xlsx",
            sheet_name="Baza",
            usecols=pair,
            skiprows=1,
        )
        df = df.dropna()

        # Zmieniaj nazwy kolumn aby pozbyć się kroprek
        new_names = {}
        for name in df.columns:
            new_name = name.split(".")[0]
            new_names.update({name: new_name})

        df.rename(columns=new_names, inplace=True)
        data.update({p_name: df})

    dfs = []
    for i in data:
        # print(data[i])
        dfs.append(data[i])

    df3 = pd.concat(dfs, ignore_index=True)

    df3.to_csv("../../database/plane_properties.csv", index=False)
