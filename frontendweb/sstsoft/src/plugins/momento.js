import Vue from "vue";
import VueMoment from "vue-moment";
import moment from "moment-timezone";

Vue.use(VueMoment, {
  moment
});

const Fechas = {
    currentDate: moment(Date.now()).format("YYYY-MM-DD"),
    currentMonth:moment(Date.now()).format("M"), 
    currentYear:moment(Date.now()).format("Y"), 
    dayBefore: moment(Date.now() - 1 * 24 * 3600 * 1000).format(
      "YYYY-MM-DD HH:mm:ss"
    ),
    sevenDaysBefore: moment(Date.now() - 7 * 24 * 3600 * 1000).format(
      "YYYY-MM-DD HH:mm:ss"
    ),
    formatDate(fecha) {
      return moment(fecha).format("YYYY-MM-DD");
    },
    dateMinusOneHour(fecha) {
      return moment(fecha)
        .subtract(1, "hour")
        .format("YYYY-MM-DD HH:mm:ss");
    }
};
  
export default Fechas;