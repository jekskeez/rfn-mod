package §_-cA§
{
   import §_-48§.ListDataEvent;
   
   public class §_-3§ extends §_-Ql§
   {
      
      public function §_-3§(param1:int = 2)
      {
         super(param1);
      }
      
      override public function §_-Fg§(param1:int) : void
      {
         var _loc2_:§_-01r§ = new §_-01r§(param1,this.team);
         if(this.§_-L2y§ == param1)
         {
            _loc2_.shaman = true;
         }
         §_-LF§(_loc2_);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      override public function §_-v1d§(param1:Array) : void
      {
         var _loc4_:§_-01r§ = null;
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Vector.<§_-3b§> = new Vector.<§_-3b§>();
         var _loc3_:Object = {};
         for each(_loc4_ in this.objects)
         {
            _loc3_[_loc4_.player.id] = _loc4_.frags;
         }
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = new §_-01r§(param1[_loc5_],this.team);
            if(param1[_loc5_] in _loc3_)
            {
               _loc4_.frags = _loc3_[param1[_loc5_]];
            }
            _loc2_.push(_loc4_);
            _loc5_++;
         }
         setData(_loc2_);
         §_-W1I§();
      }
      
      public function §_-v2N§(param1:int, param2:int) : void
      {
         var _loc3_:§_-01r§ = null;
         for each(_loc3_ in this.objects)
         {
            if(_loc3_.player.id == param1)
            {
               _loc3_.frags = param2;
               break;
            }
         }
      }
   }
}

