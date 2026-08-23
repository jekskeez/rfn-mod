package §_-o1G§
{
   import §_-42B§.§_-y2k§;
   import §_-bQ§.§_-f§;
   
   public class §_-315§ extends §_-J21§
   {
      
      public static const API:Number = 1;
      
      protected var §_-r2y§:§_-y2k§;
      
      public function §_-315§()
      {
         super();
         this.propName = "roundProps";
         this.overwriteProps = ["roundProps"];
         this.round = true;
         this.priority = -1;
         this.onInitAllProps = §_-n2s§;
      }
      
      public function add(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         §_-N2Z§(param1,param2,param3,param3 + param4,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
      
      protected function §_-B14§(param1:§_-f§) : void
      {
         if(param1.nextNode)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         if(param1.prevNode)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(§_-r2y§.§_-t1b§ == param1)
         {
            §_-r2y§.§_-t1b§ = param1.nextNode;
         }
         if(param1.§_-w27§ && Boolean(param1.target.onDisable))
         {
            param1.target.onDisable();
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         §_-r2y§ = param3;
         this.overwriteProps = this.overwriteProps.concat(param2 as Array);
         return true;
      }
      
      protected function §_-n2s§() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc4_:§_-f§ = null;
         var _loc3_:Array = §_-r2y§.vars.roundProps;
         var _loc5_:int = int(_loc3_.length);
         while(--_loc5_ > -1)
         {
            _loc1_ = _loc3_[_loc5_];
            _loc4_ = §_-r2y§.§_-t1b§;
            while(_loc4_)
            {
               if(_loc4_.name == _loc1_)
               {
                  if(_loc4_.§_-w27§)
                  {
                     _loc4_.target.round = true;
                  }
                  else
                  {
                     add(_loc4_.target,_loc1_,_loc4_.start,_loc4_.change);
                     §_-B14§(_loc4_);
                     §_-r2y§.§_-C1N§[_loc1_] = §_-r2y§.§_-C1N§.roundProps;
                  }
               }
               else if(_loc4_.§_-w27§ && _loc4_.name == "_MULTIPLE_" && !_loc4_.target.round)
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

