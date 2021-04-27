import QtQuick 2.0
import QtQml.StateMachine 1.0 as DSM

Item {
    DSM.StateMachine {
        id: vpnStateMachine
        initialState: notConnected
        running: true
        DSM.State {
            id: notConnected
            DSM.SignalTransition {
                targetState: connecting
                signal: button.clicked
            }
        }
        DSM.State {
            id: connecting
            DSM.SignalTransition {
                targetState: vpnConnected
                signal: button.clicked
            }
        }
        DSM.State {
            id: vpnConnected
            DSM.SignalTransition {
                signal: button.clicked
            }
        }
        DSM.FinalState {
            id: finalState
        }
        onFinished: Qt.quit()
    }
}
