import matplotlib.pyplot as plt


class DefaultStyles:
    def __init__(self, df):
        self.df = df

    def apply_style(self):
        plt.style.use("bmh")
        return self.df

    def legible_header(self):
        """
        Removes non-postgressy headers from a data frame
        """
        self.df.columns = (
            self.df.columns.str.strip()
            .str.lower()
            .str.replace("_", " ")
            .str.replace("(", "")
            .str.replace(")", "")
            .str.replace("#", "number")
        )
        return self.df
