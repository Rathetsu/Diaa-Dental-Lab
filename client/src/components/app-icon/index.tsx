import React from "react";

interface AppIconProps {
    width: string;
    height: string;
}

export const AppIcon: React.FC<AppIconProps> = ({ width, height }) => {
    return (
        <img
            src="/logo_.png"
            alt="Al Diaa Dental Lab"
            style={{ width: width, height: height }}
        />
    );
};
