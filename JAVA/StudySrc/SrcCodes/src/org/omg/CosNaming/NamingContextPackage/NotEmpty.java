package org.omg.CosNaming.NamingContextPackage;


/**
* org/omg/CosNaming/NamingContextPackage/NotEmpty.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from d:/re/workspace/8-2-build-windows-amd64-cygwin/jdk8u92/6642/corba/src/share/classes/org/omg/CosNaming/nameservice.idl
* Thursday, March 31, 2016 9:04:29 PM PDT
*/

public final class NotEmpty extends org.omg.CORBA.UserException
{

  public NotEmpty ()
  {
    super(NotEmptyHelper.id());
  } // ctor


  public NotEmpty (String $reason)
  {
    super(NotEmptyHelper.id() + "  " + $reason);
  } // ctor

} // class NotEmpty
