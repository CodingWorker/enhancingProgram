package com.sun.corba.se.PortableActivationIDL;


/**
* com/sun/corba/se/PortableActivationIDL/ServerAlreadyRegistered.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from d:/re/workspace/8-2-build-windows-amd64-cygwin/jdk8u92/6642/corba/src/share/classes/com/sun/corba/se/PortableActivationIDL/activation.idl
* Thursday, March 31, 2016 9:04:29 PM PDT
*/

public final class ServerAlreadyRegistered extends org.omg.CORBA.UserException
{
  public String serverId = null;

  public ServerAlreadyRegistered ()
  {
    super(ServerAlreadyRegisteredHelper.id());
  } // ctor

  public ServerAlreadyRegistered (String _serverId)
  {
    super(ServerAlreadyRegisteredHelper.id());
    serverId = _serverId;
  } // ctor


  public ServerAlreadyRegistered (String $reason, String _serverId)
  {
    super(ServerAlreadyRegisteredHelper.id() + "  " + $reason);
    serverId = _serverId;
  } // ctor

} // class ServerAlreadyRegistered
