import React, { useState } from 'react'
import { getAuth, GoogleAuthProvider, signInWithPopup } from 'firebase/auth'
import { useNavigate } from 'react-router-dom'


export interface LoginProps {

}
const Login: React.FC<LoginProps> = (props) => {
    const auth = getAuth()
    const nav = useNavigate()
    const [isAuth, setIsAuth] = useState<boolean>(false)


    const signInWithGoogle = async () => {
        setIsAuth(true)
        signInWithPopup(auth, new GoogleAuthProvider()).then(res => {
            console.log(res.user.uid);
            nav('/')

        })
            .catch(err => {
                console.log(err)
                setIsAuth(false)
            })
    }


    return (
        <div>Login</div>
    )
}

export default Login