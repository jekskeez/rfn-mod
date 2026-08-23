package §_-y1E§
{
   public class §_-61U§ extends §_-bq§
   {
      
      public var §_-63r§:Boolean;
      
      protected var §_-o9§:§_-bq§;
      
      protected var §_-S26§:§_-bq§;
      
      public function §_-61U§(param1:Object = null)
      {
         super(0,param1);
      }
      
      public function get §_-Je§() : Number
      {
         return this.§_-I10§;
      }
      
      public function insert(param1:§_-bq§, param2:* = 0) : §_-bq§
      {
         if(!param1.§_-23G§ && Boolean(param1.timeline))
         {
            param1.timeline.remove(param1,true);
         }
         param1.timeline = this;
         param1.§_-T18§ = Number(param2) + param1.delay;
         if(param1.gc)
         {
            param1.setEnabled(true,true);
         }
         if(param1.§_-bY§)
         {
            param1.§_-YV§ = param1.§_-T18§ + (this.§_-Je§ - param1.§_-T18§) / param1.§_-936§;
         }
         if(§_-o9§)
         {
            §_-o9§.nextNode = param1;
         }
         else
         {
            §_-S26§ = param1;
         }
         param1.prevNode = §_-o9§;
         §_-o9§ = param1;
         param1.nextNode = null;
         param1.§_-23G§ = false;
         return param1;
      }
      
      override public function §_-a2G§(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:§_-bq§ = null;
         var _loc4_:§_-bq§ = §_-S26§;
         this.§_-I10§ = param1;
         this.§_-Qt§ = param1;
         while(_loc4_)
         {
            _loc6_ = _loc4_.nextNode;
            if(_loc4_.active || param1 >= _loc4_.§_-T18§ && !_loc4_.§_-bY§ && !_loc4_.gc)
            {
               if(!_loc4_.§_-i8§)
               {
                  _loc4_.§_-a2G§((param1 - _loc4_.§_-T18§) * _loc4_.§_-936§,param2,false);
               }
               else
               {
                  _loc5_ = _loc4_.§_-hz§ ? _loc4_.totalDuration : _loc4_.§_-13H§;
                  _loc4_.§_-a2G§(_loc5_ - (param1 - _loc4_.§_-T18§) * _loc4_.§_-936§,param2,false);
               }
            }
            _loc4_ = _loc6_;
         }
      }
      
      public function remove(param1:§_-bq§, param2:Boolean = false) : void
      {
         if(param1.§_-23G§)
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
         else if(§_-o9§ == param1)
         {
            §_-o9§ = param1.prevNode;
         }
         if(param1.prevNode)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(§_-S26§ == param1)
         {
            §_-S26§ = param1.nextNode;
         }
         param1.§_-23G§ = true;
      }
   }
}

