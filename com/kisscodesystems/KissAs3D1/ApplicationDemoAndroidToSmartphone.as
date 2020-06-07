/*
** This class is a part of the KissAs3FwDemo application.
** See the header comment lines of the
** com . kisscodesystems . KissAs3FwDemo . ApplicationDemo
** The whole framework is available at:
** https://github.com/kisscodesystems/KissAs3Fw
** Demo applications:
** https://github.com/kisscodesystems/KissAs3FwDemos
**
** DESCRIPTION:
** ApplicationDemoAndroidToSmartphone.
** The android demo class of the KissAs3Fw.
** Will override the initialization methods to change the procedure.
**
** Copyright (C) 2017 KissCode Systems Kft
**
** ApplicationDemoAndroidToSmartphone is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** Free Software Foundation, version 3.
**
** ApplicationDemoAndroidToSmartphone is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with ApplicationDemoAndroidToSmartphone. If not, see <http://www.gnu.org/licenses/>.
*/
package com . kisscodesystems . KissAs3D1
{
  import com . kisscodesystems . KissAs3D1 . prop . PropsAppDemoAndroidToSmartphone ;
  import com . kisscodesystems . KissAs3Ds . ApplicationDemo ;
  import com . kisscodesystems . KissAs3Ds . prop . PropsDynDemo0 ;
  import com . kisscodesystems . KissAs3Ds . text . TextStockDemo ;
  import com . kisscodesystems . KissAs3Ds . text . TextsDemo ;
  public class ApplicationDemoAndroidToSmartphone extends ApplicationDemo
  {
/*
** Nothing special just constructs the new application.
*/
    public function ApplicationDemoAndroidToSmartphone ( ) : void
    {
// Super.
      super ( ) ;
    }
/*
** The overrides of the initialization methods to change the procedure.
*/
    override protected function ini00props ( ) : void
    {
// The texts and the textStock objects will be replaced.
      texts = new TextsDemo ( ) ;
      textStock = new TextStockDemo ( application ) ;
// The properties objects too.
      propsApp = new PropsAppDemoAndroidToSmartphone ( ) ;
      propsDyn = new PropsDynDemo0 ( application ) ;
    }
    override protected function ini01layers ( ) : void
    {
      super . ini01layers ( )
    }
    override protected function ini02setmenu ( ) : void
    {
      super . ini02setmenu ( )
    }
    override protected function ini03updates ( ) : void
    {
      super . ini03updates ( )
    }
    override protected function ini04langcode ( ) : void
    {
      super . ini04langcode ( )
    }
    override protected function ini05orientation ( ) : void
    {
      super . ini05orientation ( )
    }
    override protected function ini06displayingstyle ( ) : void
    {
// Let's set the displaying style!
      getMiddleground ( ) . setDisplayingStyle ( TextsDemo ( getTexts ( ) ) . DISPLAYING_STYLE_BASIC ) ;
    }
    override protected function ini07contextmenuitems ( ) : void { }
    override protected function ini08settingtosmartphone ( ) : void
    {
      super . ini08settingtosmartphone ( )
    }
    override protected function ini09settingofapplicationname ( ) : void
    {
      super . ini09settingofapplicationname ( )
    }
    override protected function ini10creationofthewholecontent ( ) : void
    {
      super . ini10creationofthewholecontent ( )
    }
  }
}