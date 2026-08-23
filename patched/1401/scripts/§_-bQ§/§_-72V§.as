package §_-bQ§
{
   public class §_-72V§ extends §_-lH§
   {
      
      public var §_-n1J§:Boolean;
      
      protected var §_-33v§:§_-lH§;
      
      protected var §_-u1z§:§_-lH§;
      
      public function §_-72V§(param1:Object = null)
      {
         super(0,param1);
      }
      
      public function get §_-b18§() : Number
      {
         return this.§_-63E§;
      }
      
      public function insert(param1:§_-lH§, param2:* = 0) : §_-lH§
      {
         if(!param1.§_-B3n§ && Boolean(param1.timeline))
         {
            param1.timeline.remove(param1,true);
         }
         param1.timeline = this;
         param1.§_-hT§ = Number(param2) + param1.delay;
         if(param1.gc)
         {
            param1.setEnabled(true,true);
         }
         if(param1.§_-Np§)
         {
            param1.§_-v2s§ = param1.§_-hT§ + (this.§_-b18§ - param1.§_-hT§) / param1.§_-L1l§;
         }
         if(§_-33v§)
         {
            §_-33v§.nextNode = param1;
         }
         else
         {
            §_-u1z§ = param1;
         }
         param1.prevNode = §_-33v§;
         §_-33v§ = param1;
         param1.nextNode = null;
         param1.§_-B3n§ = false;
         return param1;
      }
      
      override public function §_-m1b§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:§_-lH§ = null;
         var _loc4_:§_-lH§ = §_-u1z§;
         this.§_-63E§ = param1;
         this.§_-b1T§ = param1;
         while(_loc4_)
         {
            _loc6_ = _loc4_.nextNode;
            if(_loc4_.active || param1 >= _loc4_.§_-hT§ && !_loc4_.§_-Np§ && !_loc4_.gc)
            {
               if(!_loc4_.§_-xA§)
               {
                  _loc4_.§_-m1b§((param1 - _loc4_.§_-hT§) * _loc4_.§_-L1l§,param2,false);
               }
               else
               {
                  _loc5_ = _loc4_.§_-BL§ ? _loc4_.totalDuration : _loc4_.§_-n1P§;
                  _loc4_.§_-m1b§(_loc5_ - (param1 - _loc4_.§_-hT§) * _loc4_.§_-L1l§,param2,false);
               }
            }
            _loc4_ = _loc6_;
         }
      }
      
      public function remove(param1:§_-lH§, param2:Boolean = false) : void
      {
         if(param1.§_-B3n§)
         {
            return;
         }
         if(!param2)
         {
            param1.setEnabled(false,true);
         }
         if(param1.nextNode)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         else if(§_-33v§ == param1)
         {
            §_-33v§ = param1.prevNode;
         }
         if(param1.prevNode)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(§_-u1z§ == param1)
         {
            §_-u1z§ = param1.nextNode;
         }
         param1.§_-B3n§ = true;
      }
   }
}

