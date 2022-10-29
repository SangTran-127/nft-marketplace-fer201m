import React, { useState, useEffect } from "react";
import { getAuth, onAuthStateChanged } from 'firebase/auth'
import { useNavigate } from "react-router-dom";

interface AuthRouteProps {
    children: JSX.Element
}

const AuthRoute: React.FC<AuthRouteProps> = (props: AuthRouteProps) => {
    const { children } = props
    const auth = getAuth()
    const nav = useNavigate()
    const [loading, setLoading] = useState<boolean>(false)

    useEffect(() => {
        AuthCheck()
    }, [auth]);
    const AuthCheck = onAuthStateChanged(auth, (user) => {
        if (user) setLoading(false);
        else {
            console.log('Unauthorize');
            nav('/login')

        }
    })
    if (loading) return <div>Loading...</div>
    return (
        <>
            {children}
        </>
    );
}

export default AuthRoute;