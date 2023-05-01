import matplotlib.pyplot as plt
import os

def set_website_style():
    tpl_path = "https://github.com/vdenoise/templates/raw/master"
    mpl_tpl_path = f"{tpl_path}/matplotlib"
    plt.style.use(f"{mpl_tpl_path}/pacoty.mplstyle")


def set_video_style():
    tpl_path = "https://github.com/vdenoise/templates/raw/master"
    mpl_tpl_path = f"{tpl_path}/matplotlib"
    plt.style.use(f"{mpl_tpl_path}/dracula.mplstyle")


def apply_right_style():
    CURR_PROJECT = os.getenv("CURR_PROJECT")
    print(CURR_PROJECT)

    set_video_style()
