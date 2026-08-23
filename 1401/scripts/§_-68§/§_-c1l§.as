package §_-68§
{
   import §_-430§.§_-B36§;
   import §_-430§.§_-H2F§;
   import §_-430§.§_-fr§;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class §_-c1l§ extends §_-t19§
   {
      
      private static var §_-51F§:Dictionary;
      
      private static var §_-62G§:Dictionary;
      
      public static var _instance:§_-c1l§;
      
      if(!_loc2_)
      {
         §_-51F§ = new Dictionary();
         if(!_loc2_)
         {
            §_-62G§ = new Dictionary();
         }
      }
      
      private var §_-P1O§:int = 0;
      
      private var len:uint = 0;
      
      public function §_-c1l§()
      {
         if(!_loc1_)
         {
            super();
            if(!_loc1_)
            {
               _instance = this;
            }
         }
      }
      
      public static function §_-238§(param1:int, param2:Boolean = true) : §_-fr§
      {
         while(true)
         {
            if(!_loc3_)
            {
               if(!param2)
               {
                  §§push(§_-62G§[getDefinitionByName("ClothesAssets").getClassById(param1)]);
                  break;
               }
            }
            return §_-51F§[getDefinitionByName("ClothesAssets").getClassById(param1)];
         }
         return §§pop();
      }
      
      public static function §_-Q1L§() : void
      {
         if(!_loc2_)
         {
            _instance.§_-f2s§();
         }
      }
      
      private function §_-f2s§() : void
      {
         var _loc1_:§_-H2F§ = null;
         var _loc2_:* = null;
         var _loc3_:Array = getDefinitionByName("ClothesAssets").DATA;
         if(!_loc6_)
         {
            this.len = _loc3_.length;
         }
         var _loc4_:* = 0;
         if(!_loc5_)
         {
            loop0:
            while(_loc4_ < this.len)
            {
               if(_loc5_)
               {
                  var _temp_2:* = _loc4_;
                  var _temp_1:* = _loc1_;
                  var _loc6_:* = _loc6_;
                  _loc1_ = _temp_1;
                  _loc4_ = _temp_2;
                  loop1:
                  while(true)
                  {
                     §_-51F§[_loc3_[_loc4_]] = _loc1_;
                     if(_loc6_)
                     {
                        break loop7;
                     }
                     if(!_loc6_)
                     {
                        if(_loc6_)
                        {
                           var _temp_38:* = _loc3_;
                           var _temp_37:* = this;
                           _loc2_ = _loc2_;
                           this = _temp_37;
                           _loc3_ = _temp_38;
                           while(true)
                           {
                              _loc4_++;
                              if(!_loc5_)
                              {
                                 break loop7;
                              }
                           }
                           break;
                           addr0093:
                        }
                        else
                        {
                           §_-62G§[_loc3_[_loc4_]] = _loc2_;
                        }
                        if(!_loc6_)
                        {
                           if(!_loc5_)
                           {
                              §§goto(addr0093);
                           }
                           var _temp_40:* = _loc5_;
                           var _temp_39:* = _loc1_;
                           var _loc5_:* = _loc5_;
                           _loc1_ = _temp_39;
                           _loc5_ = _temp_40;
                           addr01a2:
                           _loc2_ = new §_-B36§();
                        }
                        addr01ad:
                        if(_loc6_)
                        {
                           var _temp_42:* = _loc3_;
                           var _temp_41:* = _loc2_;
                           _loc4_ = _loc4_;
                           _loc2_ = _temp_41;
                           _loc3_ = _temp_42;
                        }
                        _loc1_.§_-81c§ = 2;
                        addr01c7:
                        loop9:
                        while(true)
                        {
                           if(_loc6_)
                           {
                              var _temp_44:* = _loc4_;
                              var _temp_43:* = _loc2_;
                              _loc1_ = _loc1_;
                              _loc2_ = _temp_43;
                              _loc4_ = _temp_44;
                              while(true)
                              {
                                 _loc1_.addEventListener(Event.COMPLETE,this.§_-o2g§);
                                 addr01e9:
                                 if(!_loc6_)
                                 {
                                    while(true)
                                    {
                                       _loc1_.§_-Q1L§(§_-tn§(new _loc3_[_loc4_]()));
                                       if(!_loc5_)
                                       {
                                          break loop9;
                                       }
                                       §§goto(addr01e9);
                                    }
                                    break;
                                    addr0118:
                                 }
                                 var _temp_46:* = this;
                                 var _temp_45:* = _loc6_;
                                 _loc5_ = _loc5_;
                                 _loc6_ = _temp_45;
                                 this = _temp_46;
                              }
                              break loop1;
                              addr01db:
                           }
                           addr0211:
                           _loc1_.optimizeForRenderToTexture = true;
                           if(!_loc6_)
                           {
                              §§goto(addr01db);
                           }
                           var _temp_48:* = _loc6_;
                           var _temp_47:* = _loc5_;
                           _loc1_ = _loc1_;
                           _loc5_ = _temp_47;
                           _loc6_ = _temp_48;
                           continue loop0;
                        }
                        addr0134:
                        if(_loc6_)
                        {
                           var _temp_50:* = _loc6_;
                           var _temp_49:* = _loc5_;
                           this = this;
                           _loc5_ = _temp_49;
                           _loc6_ = _temp_50;
                        }
                        continue loop7;
                     }
                     while(true)
                     {
                        if(!_loc5_)
                        {
                           if(!_loc5_)
                           {
                              continue loop1;
                           }
                           §§push(_loc5_);
                           §§push(_loc2_);
                           _loc1_ = _loc1_;
                           _loc2_ = §§pop();
                           _loc5_ = §§pop();
                           §§goto(addr0118);
                        }
                        else
                        {
                           §§goto(addr01c7);
                        }
                     }
                     §§goto(addr0134);
                  }
                  break;
               }
               _loc1_ = new §_-H2F§();
               while(true)
               {
                  if(_loc6_)
                  {
                     var _temp_52:* = _loc4_;
                     var _temp_51:* = _loc4_;
                     this = this;
                     _loc4_ = _temp_51;
                     _loc4_ = _temp_52;
                     break loop6;
                  }
                  §§goto(addr01a2);
               }
               §§goto(addr01ad);
            }
         }
         if(!_loc5_)
         {
         }
      }
      
      private function §_-o2g§(param1:Event) : void
      {
         if(!_loc5_)
         {
            while(true)
            {
               var _loc2_:§_-c1l§ = this;
               §§push(_loc2_.§_-P1O§);
               if(!_loc5_)
               {
                  §§push(§§pop() + 1);
                  if(_loc5_)
                  {
                     break;
                  }
               }
               var _loc3_:* = §§pop();
               §§push(_loc3_);
               if(!_loc5_)
               {
                  _loc2_.§_-P1O§ = _loc3_;
               }
               break;
            }
            if(§§pop() == this.len * 2)
            {
               if(!_loc5_)
               {
                  super.onComplete(param1);
               }
            }
         }
      }
   }
}

