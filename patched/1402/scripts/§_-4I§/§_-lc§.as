package §_-4I§
{
   import §_-22D§.§_-C2E§;
   import §_-y1E§.§_-bg§;
   
   public class §_-lc§ extends §_-y2R§
   {
      
      public static const API:Number = 1;
      
      protected var §_-T2b§:§_-C2E§;
      
      public function §_-lc§()
      {
         super();
         this.propName = "roundProps";
         this.overwriteProps = ["roundProps"];
         this.round = true;
         this.priority = -1;
         this.onInitAllProps = §_-C3P§;
      }
      
      public function add(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         §_-D1f§(param1,param2,param3,param3 + param4,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
      
      protected function §_-vX§(param1:§_-bg§) : void
      {
         if(param1.nextNode)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         if(param1.prevNode)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(§_-T2b§.§_-V2§ == param1)
         {
            §_-T2b§.§_-V2§ = param1.nextNode;
         }
         if(param1.§_-33j§ && Boolean(param1.target.onDisable))
         {
            param1.target.onDisable();
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-C2E§) : Boolean
      {
         §_-T2b§ = param3;
         this.overwriteProps = this.overwriteProps.concat(param2 as Array);
         return true;
      }
      
      protected function §_-C3P§() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc4_:§_-bg§ = null;
         var _loc3_:Array = §_-T2b§.vars.roundProps;
         var _loc5_:int = int(_loc3_.length);
         while(--_loc5_ > -1)
         {
            _loc1_ = _loc3_[_loc5_];
            _loc4_ = §_-T2b§.§_-V2§;
            while(_loc4_)
            {
               if(_loc4_.name == _loc1_)
               {
                  if(_loc4_.§_-33j§)
                  {
                     _loc4_.target.round = true;
                  }
                  else
                  {
                     add(_loc4_.target,_loc1_,_loc4_.start,_loc4_.change);
                     §_-vX§(_loc4_);
                     §_-T2b§.§_-13E§[_loc1_] = §_-T2b§.§_-13E§.roundProps;
                  }
               }
               else if(_loc4_.§_-33j§ && _loc4_.name == "_MULTIPLE_" && !_loc4_.target.round)
               {
                  _loc2_ = " " + _loc4_.target.overwriteProps.join(" ") + " ";
                  if(_loc2_.indexOf(" " + _loc1_ + " ") != -1)
                  {
                     _loc4_.target.round = true;
                  }
               }
               _loc4_ = _loc4_.nextNode;
            }
         }
      }
   }
}

