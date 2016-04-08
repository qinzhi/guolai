function DateUtil() {  
    this.WeekDay;// ���ڼ�  
    this.WeekDayStr;  
    this.Day;// ����  
    this.Year;// ����  
    this.Month;// ����  
    this.Hours;// ��ǰСʱ  
    this.Minutes;  
    this.Seconds;  
    this.Time;// ��ǰ�¼�  
    var Nowdate = new Date();  
    this.WeekDay = Nowdate.getDay();  
    this.Month = Nowdate.getMonth();  
    this.Day = Nowdate.getDate();  
    this.Year = Nowdate.getFullYear();  
    this.WeekDayStr = '����' + '��һ����������'.charAt(this.WeekDay)  
    this.Hours = Nowdate.getHours();  
    this.Minutes = Nowdate.getMinutes();  
    this.Seconds = Nowdate.getSeconds();  
    this.Time = this.Year + "-" + (this.Month + 1) + "-" + this.Day + " "  
            + this.Hours + ":" + this.Minutes + ":" + this.Seconds;  
  
    // ����  
    this.showCurrentDay = function() {  
        return Nowdate;  
    };  
    // ���ܵ�һ��  
    this.showWeekFirstDay = function() {  
        var WeekFirstDay = new Date(Nowdate - (this.WeekDay - 1) * 86400000);  
        return WeekFirstDay;  
    };  
    // �������һ��  
    this.showWeekLastDay = function() {  
        var WeekFirstDay = this.showWeekFirstDay();  
        var WeekLastDay = new Date((WeekFirstDay / 1000 + 6 * 86400) * 1000);  
        return WeekLastDay;  
    };  
    // ���µ�һ��  
    this.showMonthFirstDay = function() {  
        var MonthFirstDay = new Date(this.Year, this.Month, 1);  
        return MonthFirstDay;  
    };  
    // �������һ��  
    this.showMonthLastDay = function() {  
        var MonthNextFirstDay = new Date(this.Year, this.Month + 1, 1);  
        var MonthLastDay = new Date(MonthNextFirstDay - 86400000);  
        return MonthLastDay;  
    };  
  
    // �����һ��  
    this.showYearFirstDay = function() {  
        var YearFirstDay = new Date(this.Year, 0, 1);  
        return YearFirstDay;  
    };  
    // �������һ��  
    this.showYearLastDay = function() {  
        var YearNextFirstDay = new Date(this.Year + 1, 0, 1);  
        var YearLastDay = new Date(YearNextFirstDay - 86400000);  
        return YearLastDay;  
    };  
  
    // �����һ��  
    this.showYearPreviousFirstDay = function() {  
        var YearPreviousFirstDay = new Date(this.Year - 1, 0, 1);  
        return YearPreviousFirstDay;  
    };  
    // �������һ��  
    this.showYearPreviousLastDay = function() {  
        var YearFirstDay = this.showYearFirstDay();  
        var YearPreviousLastDay = new Date(YearFirstDay - 86400000);  
        return YearPreviousLastDay;  
    };  
  
    // �����һ��  
    this.showYearNextFirstDay = function() {  
        var YearNextFirstDay = new Date(this.Year + 1, 0, 1);  
        return YearNextFirstDay;  
    };  
    // �������һ��  
    this.showYearNextLastDay = function() {  
        var step = new Date(this.Year + 2, 0, 1);  
        var YearNextLastDay = new Date(step - 86400000);  
        return YearNextLastDay;  
    };  
  
    // ���µ�һ��  
    this.showPreviousFirstDay = function() {  
        var MonthFirstDay = this.showMonthFirstDay()  
        return new Date(MonthFirstDay.getFullYear(), MonthFirstDay.getMonth()  
                        - 1, 1)  
    };  
    // �������һ��  
    this.showPreviousLastDay = function() {  
        var MonthFirstDay = this.showMonthFirstDay();  
        return new Date(MonthFirstDay - 86400000);  
    };  
    // ���ܵ�һ��  
    this.showPreviousFirstWeekDay = function() {  
        var WeekFirstDay = this.showWeekFirstDay()  
        return new Date(WeekFirstDay - 86400000 * 7)  
    };  
    // �������һ��  
    this.showPreviousLastWeekDay = function() {  
        var WeekFirstDay = this.showWeekFirstDay()  
        return new Date(WeekFirstDay - 86400000)  
    };  
    // ��һ��  
    this.showPreviousDay = function() {  
        var MonthFirstDay = new Date();  
        return new Date(MonthFirstDay - 86400000);  
    };  
    // ��һ��  
    this.showNextDay = function() {  
        var MonthFirstDay = new Date();  
        return new Date((MonthFirstDay / 1000 + 86400) * 1000);  
    };  
    // ���ܵ�һ��  
    this.showNextFirstWeekDay = function() {  
        var MonthFirstDay = this.showWeekLastDay()  
        return new Date((MonthFirstDay / 1000 + 86400) * 1000)  
    };  
    // �������һ��  
    this.showNextLastWeekDay = function() {  
        var MonthFirstDay = this.showWeekLastDay()  
        return new Date((MonthFirstDay / 1000 + 7 * 86400) * 1000)  
    };  
    // ���µ�һ��  
    this.showNextFirstDay = function() {  
        var MonthFirstDay = this.showMonthFirstDay()  
        return new Date(MonthFirstDay.getFullYear(), MonthFirstDay.getMonth()  
                        + 1, 1)  
    };  
    // �������һ��  
    this.showNextLastDay = function() {  
        var MonthFirstDay = this.showMonthFirstDay()  
        return new Date(new Date(MonthFirstDay.getFullYear(), MonthFirstDay  
                        .getMonth()  
                        + 2, 1)  
                - 86400000)  
    };  
  
    // ����json  
    this.toObject = function(startTime, endTime) {  
        var obj = {  
            start : startTime.getFullYear() + "-" + (startTime.getMonth() + 1)  
                    + "-" + startTime.getDate(),  
            end : endTime.getFullYear() + "-" + (endTime.getMonth() + 1) + "-"  
                    + endTime.getDate()  
        };  
        return obj;  
    }  
};  
// ��һ�� {start:2010-01-01 00:00:00,end:2010-12-31 23:59:59}  
DateUtil.prototype.PreviousYear = function() {  
    return this.toObject(this.showYearPreviousFirstDay(), this  
                    .showYearPreviousLastDay());  
};  
// ���� {start:2011-01-01 00:00:00,end:2011-12-31 23:59:59}  
DateUtil.prototype.CurrentYear = function() {  
    return this.toObject(this.showYearFirstDay(), this.showYearLastDay());  
};  
// ��һ�� {start:2012-01-01 00:00:00,end:2012-12-31 23:59:59}  
DateUtil.prototype.NextYear = function() {  
    return this.toObject(this.showYearNextFirstDay(), this  
                    .showYearNextLastDay());  
};  
// ��һ�� {start:2011-01-01 00:00:00,end:2011-01-31 23:59:59}  
DateUtil.prototype.PreviousMonth = function() {  
    return this.toObject(this.showPreviousFirstDay(), this  
                    .showPreviousLastDay());  
};  
// ���� {start:2011-02-01 00:00:00,end:2011-02-28 23:59:59}  
DateUtil.prototype.CurrentMonth = function() {  
    return this.toObject(this.showMonthFirstDay(), this.showMonthLastDay());  
};  
// ��һ�� {start:2011-03-01 00:00:00,end:2011-03-31 23:59:59}  
DateUtil.prototype.NextMonth = function() {  
    return this.toObject(this.showNextFirstDay(), this.showNextLastDay());  
};  
// ��һ��  
DateUtil.prototype.PreviousWeekDay = function() {  
    return this.toObject(this.showPreviousFirstWeekDay(), this  
                    .showPreviousLastWeekDay());  
};  
// ����  
DateUtil.prototype.CurrentWeekDay = function() {  
    return this.toObject(this.showWeekFirstDay(), this.showWeekLastDay());  
};  
// ��һ��  
DateUtil.prototype.NextWeekDay = function() {  
    return this.toObject(this.showNextFirstWeekDay(), this  
                    .showNextLastWeekDay());  
};  
// ��һ��  
DateUtil.prototype.PreviousDay = function() {  
    return this.toObject(this.showPreviousDay(), this.showPreviousDay());  
};  
// ����  
DateUtil.prototype.CurrentDay = function() {  
    return this.toObject(this.showCurrentDay(), this.showCurrentDay());  
};  
// ��һ��  
DateUtil.prototype.NextDay = function() {  
    return this.toObject(this.showNextDay(), this.showNextDay());  
};