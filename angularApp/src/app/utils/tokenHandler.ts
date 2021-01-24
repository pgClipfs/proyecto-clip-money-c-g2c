export class TokenHandler {
    parseToken() {
        let token = window.localStorage.getItem("token");
        return (JSON.parse(atob(token.split('.')[1])));
    }
}