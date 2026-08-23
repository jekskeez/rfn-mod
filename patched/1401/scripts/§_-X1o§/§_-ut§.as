package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   
   public class §_-ut§ extends §_-o1a§
   {
      
      public function §_-ut§(param1:int = 2)
      {
         super(param1);
      }
      
      override public function §_-73o§(param1:int) : void
      {
         var _loc2_:§_-n2n§ = new §_-n2n§(param1,this.team);
         if(this.§_-616§ == param1)
         {
            _loc2_.shaman = true;
         }
         §_-yA§(_loc2_);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      override public function §_-S2z§(param1:Array) : void
      {
         var _loc4_:§_-n2n§ = null;
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Vector.<§_-X27§> = new Vector.<§_-X27§>();
         var _loc3_:Object = {};
         for each(_loc4_ in this.objects)
         {
            _loc3_[_loc4_.player.id] = _loc4_.frags;
         }
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = new §_-n2n§(param1[_loc5_],this.team);
            if(param1[_loc5_] in _loc3_)
            {
               _loc4_.frags = _loc3_[param1[_loc5_]];
            }
            _loc2_.push(_loc4_);
            _loc5_++;
         }
         setData(_loc2_);
         §_-Fi§();
      }
      
      public function §_-n1i§(param1:int, param2:int) : void
      {
         var _loc3_:§_-n2n§ = null;
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

