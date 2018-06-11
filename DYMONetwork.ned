//
// This program is property of its copyright holder. All rights reserved.
//

package inet.examples.manetrouting.dymo;
package inet.tutorials.wireless;
package inet.examples.mobility;

import inet.common.lifecycle.LifecycleController;
import inet.common.scenario.ScenarioManager;
import inet.mobility.single.Ns2MotionMobility;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.dymo.DYMORouter;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;

//package inet.examples.mobility; #ns2mobility
import inet.environment.common.PhysicalEnvironment; //wall
import inet.visualizer.integrated.IntegratedCanvasVisualizer; //visualizer

//
// TODO
//
network DYMONetwork
{
    parameters:
        int numHosts;
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
		@signal[host2_rcvdPk];
		@delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=50,50");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=50,100");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=50,150");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=50,200");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=50,250");
        }

        host[numHosts]: DYMORouter {
            parameters:
                @display("i=device/pocketpc_s;r=,,#707070;p=343,150");
        }
        
        physicalEnvironment: PhysicalEnvironment {
				@display("p=10,500");
        }
        visualizer: IntegratedCanvasVisualizer {
				@display("p=20,500");
		}

    //        ns2MotionMobility: Ns2MotionMobility {
    //            @display("p=160,119");
    //        }
    connections allowunconnected:
}
