import React, { Component } from 'react';
import { View, StyleSheet, Button } from 'react-native';
import {widthPercentageToDP as wp, heightPercentageToDP as hp} from 'react-native-responsive-screen';
import t from 'tcomb-form-native';

const Form = t.form.Form;

const User = t.struct({
  nome: t.String,
  data_de_nascimento: t.String,
  serie_de_ingresso: t.maybe(t.String),
  endereco: t.maybe(t.String),
  cep: t.maybe(t.String),
  rua: t.maybe(t.String),
  numero: t.maybe(t.String),
  bairro: t.maybe(t.String),
  cidade: t.maybe(t.String),
  estado: t.maybe(t.String),
  nome_da_mae: t.String,
  cpf_da_mae: t.String,
  data_preferencial_de_pagamento: t.String,
});

const formStyles = {
  ...Form.stylesheet,
  formGroup: {
    normal: {
      marginBottom: 10
    },
  },
  controlLabel: {
    normal: {
      color: 'blue',
      fontSize: 18,
      marginBottom: 7,
      fontWeight: '600'
    },
    // the style applied when a validation error occours
    error: {
      color: 'red',
      fontSize: 18,
      marginBottom: 7,
      fontWeight: '600'
    }
  }
}


export default class App extends Component {
  handleSubmit = () => {
      fetch('api_salvar.php', {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this._form.getValue()),
      });
  }
  
  render() {
    return (
      <View style={styles.container}>
        <Form 
          ref={c => this._form = c}
          type={User}
        />
        <Button
          title="Salvar!"
          onPress={this.handleSubmit}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: wp('84.5%'),
    height: hp('17%'),
    justifyContent: 'center',
    marginTop: 50,
    padding: 20,
    backgroundColor: '#ffffff',
  },
});
