import Vue from "vue";
import Echarts from "vue-echarts";

import "echarts/lib/chart/bar";
import "echarts/lib/chart/line";
import "echarts/lib/chart/pie";
import "echarts/lib/component/tooltip";
import "echarts/lib/component/legend";
import "echarts/lib/component/legendScroll";
import "echarts/lib/component/title";
import "echarts/lib/component/visualMap";
import "echarts/lib/component/dataset";
import "echarts/lib/component/toolbox";
import "echarts/lib/component/graphic";

Vue.component("chart", Echarts);