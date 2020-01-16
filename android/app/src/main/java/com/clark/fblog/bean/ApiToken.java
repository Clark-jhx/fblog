package com.clark.fblog.bean;

public class ApiToken {

    /**
     * access_token : eyJhbGciOiJSUzI1NiIsImtpZCI6IjlFMjcyMkFGM0IzRTFDNzU5RTI3NEFBRDI5NDFBNzg1MDlCMDc2RDAiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJuaWNpcnpzLUhIV2VKMHF0S1VHbmhRbXdkdEEifQ.eyJuYmYiOjE1Nzg1Njc4MTMsImV4cCI6MTU3ODY1NDIxMywiaXNzIjoiaHR0cDovL29wZW5hcGlfb2F1dGgtc2VydmVyIiwiYXVkIjpbImh0dHA6Ly9vcGVuYXBpX29hdXRoLXNlcnZlci9yZXNvdXJjZXMiLCJDbkJsb2dzQXBpIl0sImNsaWVudF9pZCI6IjJiMjg1ODk4LTAzOTQtNDFjMy1hOGRjLTgyM2M0ODYwYWI0MSIsInNjb3BlIjpbIkNuQmxvZ3NBcGkiXX0.j1rwngVQKmNSnwAbOQTfHZTjoZhTYnBdRR_v9Gp5j6uu4o84I5iKHju6yWzbWWwKt__ksQK_0E-pLO6r-NTcK6jf_0SlAUuon-4uzJVYt_szPRX_GehbOF0l0Xl_ehFl_sTlkfpjV31SWJXbJBqsEurlbqE4d9S2Zwou3vpmpCh8Y1dzFXdjCy2PSgiBF4ZlKZ9S2OBD9O0J45y3AOSYnsmHM1PBLSQMAwSH0WWSLdEYBD4tcKY_VSib94c93-kC7agDwKch2MmoyaJ4uogiN_JdzB1yAUKNDRgrkKocIsLsncj1UUMT6_BrsQHJPqz3nMAoyOBcj0RX21lwmuWlYg
     * expires_in : 86400
     * token_type : Bearer
     */

    private String access_token;
    private int expires_in;
    private String token_type;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public int getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(int expires_in) {
        this.expires_in = expires_in;
    }

    public String getToken_type() {
        return token_type;
    }

    public void setToken_type(String token_type) {
        this.token_type = token_type;
    }
}
