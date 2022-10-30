import React from 'react'
import { getAuth, signOut } from 'firebase/auth'
interface HomePageProps {

}
const HomePage: React.FC<HomePageProps> = (props) => {
    const auth = getAuth()
    return (
        <div>
            HomePage
            <button onClick={() => signOut(auth)}>Sign Out</button>
        </div>
    )
}

export default HomePage