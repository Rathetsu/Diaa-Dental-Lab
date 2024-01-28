import { Authenticated, Refine } from "@refinedev/core";
import { RefineKbar, RefineKbarProvider } from "@refinedev/kbar";
import {
    ErrorComponent,
    ThemedLayoutV2,
    ThemedSiderV2,
    ThemedTitleV2,
    useNotificationProvider,
} from "@refinedev/antd";
import "@refinedev/antd/dist/reset.css";
import nestjsxCrudDataProvider from "@refinedev/nestjsx-crud";
import routerBindings, {
    CatchAllNavigate,
    DocumentTitleHandler,
    NavigateToResource,
    UnsavedChangesNotifier,
} from "@refinedev/react-router-v6";
import { App as AntdApp } from "antd";
import { useTranslation } from "react-i18next";
import { BrowserRouter, Outlet, Route, Routes } from "react-router-dom";
import { authProvider } from "./authProvider";
import { AppIcon } from "./components/app-icon";
import { Header } from "./components/header";
import { ColorModeContextProvider } from "./contexts/color-mode";
import { Login } from "./pages/login";

function App() {
    const { t, i18n } = useTranslation();

    const API_URL = "http://localhost:3000/api";
    const dataProvider = nestjsxCrudDataProvider(API_URL);

    const i18nProvider = {
        translate: (key: string, params: object) => t(key, params),
        changeLocale: (lang: string) => i18n.changeLanguage(lang),
        getLocale: () => i18n.language,
    };

    return (
        <BrowserRouter>
            <RefineKbarProvider>
                <ColorModeContextProvider>
                    <AntdApp>
                        <Refine
                            dataProvider={dataProvider}
                            notificationProvider={useNotificationProvider}
                            authProvider={authProvider}
                            i18nProvider={i18nProvider}
                            routerProvider={routerBindings}
                            options={{
                                syncWithLocation: true,
                                warnWhenUnsavedChanges: true,
                                useNewQueryKeys: true,
                                projectId: "1DaFAZ-JnFXm2-eXFFCS",
                            }}
                        >
                            <Routes>
                                <Route
                                    element={
                                        <Authenticated
                                            key="authenticated-inner"
                                            fallback={
                                                <CatchAllNavigate to="/login" />
                                            }
                                        >
                                            <ThemedLayoutV2
                                                Header={() => <Header sticky />}
                                                Sider={(props) => (
                                                    <ThemedSiderV2
                                                        {...props}
                                                        fixed
                                                    />
                                                )}
                                                Title={({ collapsed }) => (
                                                    <ThemedTitleV2
                                                        collapsed={collapsed}
                                                        text="Al Diaa Dental Lab"
                                                        icon={<AppIcon />}
                                                    />
                                                )}
                                            >
                                                <Outlet />
                                            </ThemedLayoutV2>
                                        </Authenticated>
                                    }
                                >
                                    <Route
                                        index
                                        element={
                                            <NavigateToResource resource="blog_posts" />
                                        }
                                    />
                                    <Route
                                        path="*"
                                        element={<ErrorComponent />}
                                    />
                                </Route>
                                <Route
                                    element={
                                        <Authenticated
                                            key="authenticated-outer"
                                            fallback={<Outlet />}
                                        >
                                            <NavigateToResource />
                                        </Authenticated>
                                    }
                                >
                                    <Route path="/login" element={<Login />} />
                                </Route>
                            </Routes>

                            <RefineKbar />
                            <UnsavedChangesNotifier />
                            <DocumentTitleHandler />
                        </Refine>
                    </AntdApp>
                </ColorModeContextProvider>
            </RefineKbarProvider>
        </BrowserRouter>
    );
}

export default App;
