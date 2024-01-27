import { AuthBindings } from "@refinedev/core";
export const TOKEN_KEY = "aldiaa-auth";

export const authProvider: AuthBindings = {
    login: async ({ email, password }) => {
        try {
            const response = await fetch("http://localhost:3000/auth/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ email, password }),
            });

            const data = await response.json();

            if (response.ok && data.token) {
                localStorage.setItem(TOKEN_KEY, data.token);
                return {
                    success: true,
                    redirectTo: "/",
                };
            } else {
                return {
                    success: false,
                    error: {
                        name: "LoginError",
                        message: data.message || "Invalid credentials",
                    },
                };
            }
        } catch (error) {
            console.error(error);
            return {
                success: false,
                error: {
                    name: "NetworkError",
                    message: "Unable to connect to the server",
                },
            };
        }
    },

    logout: async () => {
        localStorage.removeItem(TOKEN_KEY);
        return {
            success: true,
            redirectTo: "/login",
        };
    },
    check: async () => {
        const token = localStorage.getItem(TOKEN_KEY);
        if (token) {
            return {
                authenticated: true,
            };
        }

        return {
            authenticated: false,
            redirectTo: "/login",
        };
    },
    getPermissions: async () => null,
    getIdentity: async () => {
        const token = localStorage.getItem(TOKEN_KEY);
        if (token) {
            return {
                id: 1,
                name: "John Doe",
                avatar: "https://i.pravatar.cc/300",
            };
        }
        return null;
    },
    onError: async (error) => {
        console.error(error);
        return { error };
    },
};
