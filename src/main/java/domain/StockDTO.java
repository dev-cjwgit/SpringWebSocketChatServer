package domain;

import java.sql.Date;
import java.sql.Timestamp;

public class StockDTO {
    protected String name;
    protected Double open;
    protected Double high;
    protected Double low;
    protected Double close;
    protected Double adj_close;
    protected Long volume;
    protected Timestamp date;


    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getOpen() {
        return open;
    }

    public void setOpen(Double open) {
        this.open = open;
    }

    public Double getHigh() {
        return high;
    }

    public void setHigh(Double high) {
        this.high = high;
    }

    public Double getLow() {
        return low;
    }

    public void setLow(Double low) {
        this.low = low;
    }

    public Double getClose() {
        return close;
    }

    public void setClose(Double close) {
        this.close = close;
    }

    public Double getAdj_close() {
        return adj_close;
    }

    public void setAdj_close(Double adj_close) {
        this.adj_close = adj_close;
    }

    public Long getVolume() {
        return volume;
    }

    public void setVolume(Long volume) {
        this.volume = volume;
    }


}
