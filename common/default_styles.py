import matplotlib.pyplot as plt


class DefaultStyles:

    plt.style.use("fivethirtyeight")

    def legible_header(self, df):
        """
        Removes non-postgressy headers from a data frame
        """
        df.columns = (
            df.columns.str.strip()
            .str.lower()
            .str.replace("_", " ")
            .str.replace("(", "")
            .str.replace(")", "")
            .str.replace("#", "number")
        )
        return df
