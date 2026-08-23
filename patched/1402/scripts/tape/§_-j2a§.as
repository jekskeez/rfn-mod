package tape
{
   import §_-a11§.TapeDataEvent;
   import §_-a11§.§_-h2m§;
   import com.api.Player;
   
   public class §_-j2a§ extends §_-h2f§
   {
      
      protected var §_-hI§:uint = 0;
      
      protected var §_-V1J§:Array = [];
      
      public function §_-j2a§()
      {
         super(TapePlayer);
      }
      
      override public function §_-Z1P§(param1:§_-h2m§) : void
      {
         var _loc2_:§_-QN§ = null;
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
            _loc3_.listen(this.§_-Z1P§);
            _loc3_.player.addEventListener(this.§_-hI§,this.§_-Y16§);
            this.objects.unshift(_loc3_);
            _loc2_.push(_loc3_.playerId);
         }
         §_-w1d§(int.MAX_VALUE);
         this.§_-SQ§(_loc2_);
      }
      
      override protected function sort() : void
      {
         if(this.§_-V1J§.length > 0)
         {
            return;
         }
         this.§_-J2c§();
         dispatchEvent(new TapeDataEvent(TapeDataEvent.UPDATE,this));
      }
      
      protected function §_-J2c§() : void
      {
         super.sort();
      }
      
      protected function §_-SQ§(param1:Array) : void
      {
         if(this.§_-hI§ == 0)
         {
            return;
         }
         this.§_-V1J§ = this.§_-V1J§.concat(param1);
         Game.request(param1,this.§_-hI§,true);
      }
      
      protected function §_-Y16§(param1:Player) : void
      {
         var _loc2_:int = this.§_-V1J§.indexOf(param1.id);
         if(_loc2_ == -1)
         {
            return;
         }
         this.§_-V1J§.splice(_loc2_,1);
         if(this.§_-V1J§.length == 0)
         {
            this.sort();
         }
      }
   }
}

