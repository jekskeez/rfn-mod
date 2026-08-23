package §_-s2e§
{
   import §_-6R§.§_-518§;
   import §_-6R§.§_-E20§;
   import §_-6R§.§_-h1s§;
   import §_-C1Y§.§_-X2Y§;
   import §_-C1Y§.§_-pr§;
   import §_-C1Y§.§_-tc§;
   import dragonBones.§_-z2H§;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.utils.ByteArray;
   
   public class §_-O1h§ extends §_-O17§
   {
      
      public static const §_-m11§:String = "Squirrel";
      
      public static const §_-rR§:String = "Scrat";
      
      public static const §_-b2N§:String = "Scratty";
      
      public static const §_-Z1h§:String = "Dragon";
      
      public static const §_-71l§:String = "Hare";
      
      public static const §_-fo§:String = "SnowLeopard";
      
      public static const §_-U2G§:String = "WildBoar";
      
      public static const §_-e1k§:String = "WildHog";
      
      private static var §_-82N§:§_-pr§;
      
      private static var §_-j22§:§_-X2Y§;
      
      private static var §_-UD§:ByteArray = null;
      
      loop4:
      while(true)
      {
         loop5:
         while(true)
         {
            if(!_loc1_)
            {
               if(_loc1_)
               {
                  break;
               }
               loop6:
               while(true)
               {
                  loop7:
                  while(true)
                  {
                     if(_loc2_)
                     {
                        var _temp_6:* = _loc2_;
                        var _temp_5:* = §_-O1h§;
                        var _loc1_:* = _loc1_;
                        this = _temp_5;
                        var _loc2_:* = _temp_6;
                        loop0:
                        while(true)
                        {
                           if(_loc1_)
                           {
                              break loop4;
                           }
                           if(!_loc2_)
                           {
                              break loop7;
                           }
                           var _temp_14:* = §_-O1h§;
                           var _temp_13:* = _loc1_;
                           _loc2_ = _loc2_;
                           _loc1_ = _temp_13;
                           this = _temp_14;
                           loop1:
                           while(true)
                           {
                              if(_loc2_)
                              {
                                 break loop4;
                              }
                              if(!_loc1_)
                              {
                                 if(!_loc1_)
                                 {
                                    if(!_loc2_)
                                    {
                                       break;
                                    }
                                    var _temp_16:* = _loc2_;
                                    var _temp_15:* = _loc2_;
                                    _loc2_ = _loc2_;
                                    _loc2_ = _temp_15;
                                    _loc2_ = _temp_16;
                                    do
                                    {
                                       if(_loc2_)
                                       {
                                          break loop6;
                                       }
                                       if(!_loc1_)
                                       {
                                          continue loop1;
                                       }
                                       var _temp_18:* = §_-O1h§;
                                       var _temp_17:* = _loc1_;
                                       _loc1_ = _loc1_;
                                       _loc1_ = _temp_17;
                                       this = _temp_18;
                                    }
                                    while(!_loc1_);
                                    break loop0;
                                    addr0068:
                                 }
                                 addr008c:
                                 if(_loc2_)
                                 {
                                    var _temp_20:* = §_-O1h§;
                                    var _temp_19:* = §_-O1h§;
                                    _loc1_ = _loc1_;
                                    this = _temp_19;
                                    this = _temp_20;
                                 }
                              }
                              if(_loc1_)
                              {
                                 break loop0;
                              }
                              §§goto(addr0068);
                           }
                        }
                        var _temp_22:* = _loc1_;
                        var _temp_21:* = §_-O1h§;
                        this = §_-O1h§;
                        this = _temp_21;
                        _loc1_ = _temp_22;
                        break;
                     }
                     §§goto(addr008c);
                  }
                  if(!_loc1_)
                  {
                     break loop5;
                  }
                  break;
               }
               §§goto(addr00f0);
            }
            §§goto(addr0035);
         }
         if(!_loc1_)
         {
            break loop6;
         }
         var _temp_24:* = _loc2_;
         var _temp_23:* = _loc1_;
         _loc1_ = _loc1_;
         _loc1_ = _temp_23;
         _loc2_ = _temp_24;
         §§goto(addr00c5);
      }
      addr00df:
      if(_loc2_)
      {
         var _temp_2:* = _loc2_;
         var _temp_1:* = §_-O1h§;
         _loc2_ = _loc2_;
         this = _temp_1;
         _loc2_ = _temp_2;
         if(!_loc2_)
         {
            do
            {
               §_-UD§ = null;
               if(_loc1_)
               {
                  continue;
               }
               §§goto(addr00df);
            }
            while(!_loc2_);
            addr00c5:
         }
         var _temp_4:* = _loc2_;
         var _temp_3:* = §_-O1h§;
         _loc2_ = _loc2_;
         this = _temp_3;
         _loc2_ = _temp_4;
      }
      
      public function §_-O1h§()
      {
         if(!_loc2_)
         {
            super();
         }
      }
      
      public static function §_-y1y§(param1:Boolean = true) : §_-tc§
      {
         while(true)
         {
            if(!_loc2_)
            {
               if(!param1)
               {
                  §§push(§_-em§);
                  break;
               }
            }
            return §_-Da§;
         }
         return §§pop();
      }
      
      public static function §_-73U§(param1:Boolean = true) : §_-z2H§
      {
         while(true)
         {
            §§push(§§findproperty(§_-z2H§));
            if(!_loc3_)
            {
               if(!param1)
               {
                  §§push(new §_-518§());
                  break;
               }
            }
            §§push(new §_-h1s§());
            break;
         }
         return new §§pop().§_-z2H§(§§pop());
      }
      
      public static function §_-OV§() : void
      {
         loop2:
         while(true)
         {
            if(!_loc2_)
            {
               if(!§_-UD§)
               {
                  if(!_loc1_)
                  {
                     return;
                  }
                  while(true)
                  {
                     if(!_loc2_)
                     {
                        break loop2;
                     }
                     var _temp_2:* = _loc1_;
                     var _temp_1:* = _loc1_;
                     var _loc2_:* = _loc2_;
                     var _loc1_:* = _temp_1;
                     _loc1_ = _temp_2;
                  }
                  addr0081:
                  var _temp_4:* = _loc1_;
                  var _temp_3:* = _loc1_;
                  _loc2_ = _loc2_;
                  _loc1_ = _temp_3;
                  _loc1_ = _temp_4;
                  break;
                  addr0061:
               }
               §_-Da§.§_-F1X§(§_-UD§);
            }
            do
            {
               if(!_loc1_)
               {
                  continue;
               }
               §§goto(addr0081);
            }
            while(§_-em§.§_-F1X§(§_-UD§), _loc1_);
            §§goto(addr0061);
         }
      }
      
      private static function get §_-Da§() : §_-pr§
      {
         if(§_-82N§)
         {
            return §_-82N§;
         }
         §_-82N§ = new §_-pr§();
         §_-82N§.§_-VI§ = 2;
         §_-82N§.optimizeForRenderToTexture = true;
         return §_-82N§;
      }
      
      private static function get §_-em§() : §_-X2Y§
      {
         if(!§_-j22§)
         {
            §_-j22§ = new §_-X2Y§();
         }
         return §_-j22§;
      }
      
      override public function loadBytes(param1:Class) : void
      {
         if(!_loc3_)
         {
            §_-UD§ = §_-u27§(new param1() as ByteArray);
            if(!_loc2_)
            {
               onComplete(null);
            }
         }
      }
      
      override protected function onLoaded(param1:Event) : void
      {
         if(!_loc3_)
         {
            §_-UD§ = §_-u27§((param1.currentTarget as URLLoader).data as ByteArray);
            if(!_loc2_)
            {
               onComplete(param1);
            }
         }
      }
   }
}

