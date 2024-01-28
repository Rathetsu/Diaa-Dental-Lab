import { AuthPage, ThemedTitleV2 } from "@refinedev/antd";
import { AppIcon } from "../../components/app-icon";

export const Login = () => {
    return (
        <AuthPage
            type="login"
            title={
                <ThemedTitleV2
                    collapsed={true}
                    icon={<AppIcon width={"300px"} height={"90px"} />}
                    wrapperStyles={{
                        display: "flex",
                        alignSelf: "center",
                        marginBottom: "50px",
                        marginRight: "280px",
                    }}
                />
            }
        />
    );
};
