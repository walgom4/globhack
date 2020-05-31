const AUTH_KEY = "auth_key";
const USER_KEY = "auth_user";
const USER_PW = "auth_pw";

/**
 * Maneja el acceso a los tokens desde las cookies.
 **/
const TokenService = {

  getKey() {
    return window.$cookies.get(AUTH_KEY);
  },

  getUser() {
    return window.$cookies.get(USER_KEY);
  },

  getUserPw() {
    return window.$cookies.get(USER_PW);
  },

  setKey(accessToken) {
    window.$cookies.set(AUTH_KEY, accessToken);
  },

  setUser(credentialUser) {
    window.$cookies.set(USER_KEY, credentialUser);
  },

  setUserPw(credentialUserPw) {
    window.$cookies.set(USER_PW, credentialUserPw);
  },

  removeAllToken() {
    window.$cookies.remove(AUTH_KEY);
    window.$cookies.remove(USER_KEY);
    window.$cookies.remove(USER_PW);
  }
};

export { TokenService };
