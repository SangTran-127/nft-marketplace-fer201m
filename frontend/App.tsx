import React from "react"
import logo from "./assets/dfinity.svg"
import AppRoutes from "./Routes"
/*
  firebase
*/

import { initializeApp } from 'firebase/app'
import { config } from './config/config'
/*
 * Connect2ic provides essential utilities for IC app development
 */
import { createClient } from "@connect2ic/core"
import { defaultProviders } from "@connect2ic/core/providers"
import { ConnectButton, ConnectDialog, Connect2ICProvider } from "@connect2ic/react"
import "@connect2ic/core/style.css"
/*
 * Import canister definitions like this:
 */
import * as counter from "../.dfx/local/canisters/counter"
/*
 * Some examples to get you started
 */
import { Counter } from "./components/Counter"
import { Transfer } from "./components/Transfer"
import { Profile } from "./components/Profile"

export const Firebase = initializeApp(config.firebaseConfig)


function App() {
  return (
    <div className="App">
      <AppRoutes />
    </div>
  )
}

const client = createClient({
  canisters: {
    counter,
  },
  providers: defaultProviders,
  globalProviderConfig: {
    dev: import.meta.env.DEV,
  },
})

export default () => (
  <Connect2ICProvider client={client}>
    <App />
  </Connect2ICProvider>
)




// <div className="auth-section">
//         <ConnectButton />
//       </div>
//       <ConnectDialog />

//       <header className="App-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p className="slogan">
//           Con Cac
//         </p>
//         <p className="twitter">by <a href="https://twitter.com/miamaruq">@miamaruq</a></p>
//       </header>

//       <p className="examples-title">
//         Examples
//       </p>
//       <div className="examples">
//         <Counter />
//         <Profile />
//         <Transfer />
//       </div>