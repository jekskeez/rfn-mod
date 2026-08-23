package §_-68§
{
   import §_-430§.§_-B36§;
   import §_-430§.§_-H2F§;
   import §_-430§.§_-fr§;
   import §_-Rz§.§_-83J§;
   import §_-Rz§.§_-p1S§;
   import §_-Rz§.§_-v2r§;
   import dragonBones.§_-Bq§;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.utils.ByteArray;
   
   public class §_-M10§ extends §_-t19§
   {
      
      public static const §_-OS§:String = "Squirrel";
      
      public static const §_-q1G§:String = "Scrat";
      
      public static const §_-qT§:String = "Scratty";
      
      public static const §_-c2v§:String = "Dragon";
      
      public static const §_-E2R§:String = "Hare";
      
      public static const §_-R2l§:String = "SnowLeopard";
      
      public static const §_-u§:String = "WildBoar";
      
      public static const §_-31y§:String = "WildHog";
      
      private static var §_-H10§:§_-H2F§;
      
      private static var §_-s2k§:§_-B36§;
      
      private static var §_-E28§:ByteArray = null;
      
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
                        var _temp_5:* = §_-M10§;
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
                           var _temp_14:* = §_-M10§;
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
                                       var _temp_18:* = §_-M10§;
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
                                    var _temp_20:* = §_-M10§;
                                    var _temp_19:* = §_-M10§;
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
                        var _temp_21:* = §_-M10§;
                        this = §_-M10§;
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
         var _temp_1:* = §_-M10§;
         _loc2_ = _loc2_;
         this = _temp_1;
         _loc2_ = _temp_2;
         if(!_loc2_)
         {
            do
            {
               §_-E28§ = null;
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
         var _temp_3:* = §_-M10§;
         _loc2_ = _loc2_;
         this = _temp_3;
         _loc2_ = _temp_4;
      }
      
      public function §_-M10§()
      {
         if(!_loc2_)
         {
            super();
         }
      }
      
      public static function §_-238§(param1:Boolean = true) : §_-fr§
      {
         while(true)
         {
            if(!_loc2_)
            {
               if(!param1)
               {
                  §§push(§_-41Y§);
                  break;
               }
            }
            return §_-3o§;
         }
         return §§pop();
      }
      
      public static function §_-r2s§(param1:Boolean = true) : §_-Bq§
      {
         while(true)
         {
            §§push(§§findproperty(§_-Bq§));
            if(!_loc3_)
            {
               if(!param1)
               {
                  §§push(new §_-v2r§());
                  break;
               }
            }
            §§push(new §_-83J§());
            break;
         }
         return new §§pop().§_-Bq§(§§pop());
      }
      
      public static function §_-Z2R§() : void
      {
         loop2:
         while(true)
         {
            if(!_loc2_)
            {
               if(!§_-E28§)
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
               §_-3o§.§_-Q1L§(§_-E28§);
            }
            do
            {
               if(!_loc1_)
               {
                  continue;
               }
               §§goto(addr0081);
            }
            while(§_-41Y§.§_-Q1L§(§_-E28§), _loc1_);
            §§goto(addr0061);
         }
      }
      
      private static function get §_-3o§() : §_-H2F§
      {
         if(§_-H10§)
         {
            return §_-H10§;
         }
         §_-H10§ = new §_-H2F§();
         §_-H10§.§_-81c§ = 2;
         §_-H10§.optimizeForRenderToTexture = true;
         return §_-H10§;
      }
      
      private static function get §_-41Y§() : §_-B36§
      {
         if(!§_-s2k§)
         {
            §_-s2k§ = new §_-B36§();
         }
         return §_-s2k§;
      }
      
      override public function loadBytes(param1:Class) : void
      {
         if(!_loc3_)
         {
            §_-E28§ = §_-tn§(new param1() as ByteArray);
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
            §_-E28§ = §_-tn§((param1.currentTarget as URLLoader).data as ByteArray);
            if(!_loc2_)
            {
               onComplete(param1);
            }
         }
      }
   }
}

