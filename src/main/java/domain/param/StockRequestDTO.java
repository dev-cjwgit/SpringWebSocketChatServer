package domain.param;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class StockRequestDTO {
    protected String name;
    protected String sortType = "DESC";
    protected String startDate = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA).format(new Date(new Date().getTime() + (1000 * 60 * 60 * 24 * -1)));
    protected String endDate = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA).format(new Date(new Date().getTime() + (1000 * 60 * 60 * 24 * -1)));

    @Override
    public String toString() {
        return "StockRequestDTO{" +
                "name='" + name + '\'' +
                ", sortType='" + sortType + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        sortType = sortType.toLowerCase(Locale.ROOT);
        switch (sortType) {
            case "asc":
            case "desc":
                this.sortType = sortType;
                break;
            default:
                this.sortType = "desc";
        }
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
