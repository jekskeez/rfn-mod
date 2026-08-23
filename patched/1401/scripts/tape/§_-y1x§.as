package tape
{
   import §_-r2Y§.TapeDataEvent;
   import §_-r2Y§.§_-33e§;
   import com.api.Player;
   
   public class §_-y1x§ extends §_-xc§
   {
      
      protected var §_-vE§:uint = 0;
      
      protected var §_-i1W§:Array = [];
      
      public function §_-y1x§()
      {
         super(TapePlayer);
      }
      
      override public function §_-YC§(param1:§_-33e§) : void
      {
         var _loc2_:§_-K2k§ = null;
         for each(_loc2_ in this.objects)
         {
            if(!_loc2_.loaded)
            {
               return;
            }
         }
         this.sort();
      }
      
      public function add(param1:TapePlayer) : void
      {
         this.set([param1]);
      }
      
      public function set(param1:Array) : void
      {
         var _loc3_:TapePlayer = null;
         if(param1.length == 0)
         {
            return;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc3_.listen(this.§_-YC§);
            _loc3_.player.addEventListener(this.§_-vE§,this.§_-P9§);
            this.objects.unshift(_loc3_);
            _loc2_.push(_loc3_.playerId);
         }
         §_-93o§(int.MAX_VALUE);
         this.§_-k2k§(_loc2_);
      }
      
      override protected function sort() : void
      {
         if(this.§_-i1W§.length > 0)
         {
            return;
         }
         this.§_-Y1n§();
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      protected function §_-Y1n§() : void
      {
         super.sort();
      }
      
      protected function §_-k2k§(param1:Array) : void
      {
         if(this.§_-vE§ == 0)
         {
            return;
         }
         this.§_-i1W§ = this.§_-i1W§.concat(param1);
         Game.request(param1,this.§_-vE§,true);
      }
      
      protected function §_-P9§(param1:Player) : void
      {
         var _loc2_:int = this.§_-i1W§.indexOf(param1.id);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-i1W§.splice(_loc2_,1);
         if(this.§_-i1W§.length == 0)
         {
            this.sort();
         }
      }
   }
}

