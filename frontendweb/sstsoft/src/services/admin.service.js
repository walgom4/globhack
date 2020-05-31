/* eslint-disable no-useless-catch */
/* eslint-disable no-unused-vars */
/* eslint-disable no-console */
import ApiService from "@/plugins/axios";
//import { TokenService } from "@/services/storage.service";

const AdminService = {
  //servicio de login
  async login(credentials) {
    try {
      var response = await ApiService.post("/auth/login/", {        
          username: credentials.user,
          password: credentials.password        
      });

      return response

    } catch (ex) {
      throw ex;
    }
  },
  //servicio de obtener registros pendientes
  async getRegisters() {
    try {
        var response = await ApiService.get("/user/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener usuario especifico
  async getRegistersUnique(id) {
    try {
        var response = await ApiService.get("/user/{"+id+"}");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de editar usuario especifico
  async editRegistersUnique(data) {
    try {
        var response = await ApiService.put("/user/{"+data.id+"}", {

            is_sst: data.is_sst,
            area_fk_user: data.area_fk_user
          
        });
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros area
  async getArea() {
    try {
        var response = await ApiService.get("/area/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros eps
  async getEps() {
    try {
        var response = await ApiService.get("/eps/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros genero
  async getGender() {
    try {
        var response = await ApiService.get("/gender/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros tipo id
  async getIdType() {
    try {
        var response = await ApiService.get("/idType/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros transporte
  async getTransport() {
    try {
        var response = await ApiService.get("/transport/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener registros recursos
  async getResources() {
    try {
        var response = await ApiService.get("/resources/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio de obtener seguimiento
  async getTracing() {
    try {
        var response = await ApiService.get("/userHealthRegister/");
        return response;
    } catch (ex) {
        throw ex;
    }
  },

  //servicio obtener historico
  async getHistoricTracing(id) {
    try {
        var response = await ApiService.get("/userHealthRegister/",{
          params: {
            user_fk_health: id
          }
        });
        return response;
    } catch (ex) {
        throw ex;
    }
  }
};

export {AdminService};
