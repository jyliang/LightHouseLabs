/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, NativeModules} from 'react-native';
import MakeItRain from './MakeItRain'
import RainView from './RainView'
var RainManager = NativeModules.RainManager;
// CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey');

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
  // render() {
  //   return (
  //     <View style={styles.container}>
  //       <RainView style={{flex:1, backgroundColor:'red'}}/>
  //       {/* <MakeItRain /> */}
  //       {/* <View style={{position:"absolute", right:0, bottom:0, width:100, height:100, backgroundColor:"red"}}></View>
  //       <Text style={styles.welcome}>Welcome to React Native</Text>
  //       <Text style={styles.welcome}>David is the only one here today 😢</Text>
  //       <Text style={styles.welcome}>Paul is also here 👻</Text>
  //       <Text style={styles.instructions}>To get started, edit App.js</Text>
  //       <Text style={styles.instructions}>{instructions}</Text> */}
        
  //     </View>
  //   );
  // }
  componentDidMount() {
    // if (this.refs.rainView) {
    //   this.refs.rainView.startRain()
    // }
  }

  componentWillUnmount() {
    this.refs.rainView.stopRain()
  }

  render() {
    return (
      <View style={{flex:1, justifyContent: 'center'}}>
        <RainView ref="rainView" style={{flex:1, backgroundColor:'purple'}}/>
    </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
