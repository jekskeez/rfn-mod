package §_-cA§
{
   import §_-48§.ListDataEvent;
   import §_-48§.ListElementEvent;
   
   public class §_-Ql§ extends §_-I2x§
   {
      
      protected var §_-L2y§:int = -1;
      
      protected var team:int;
      
      public function §_-Ql§(param1:int = 2)
      {
         super();
         this.team = param1;
      }
      
      public function §_-Fg§(param1:int) : void
      {
         var _loc2_:§_-wO§ = new §_-wO§(param1,this.team);
         if(this.§_-L2y§ == param1)
         {
            _loc2_.shaman = true;
         }
         §_-LF§(_loc2_);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-9E§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if((this.objects[_loc2_] as §_-wO§).player.id == param1)
            {
               this.objects[_loc2_].removeEventListener(ListElementEvent.CHANGED,this.§_-Z1P§);
               this.objects.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
         if(param1 == this.§_-L2y§)
         {
            this.§_-L2y§ = -1;
         }
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-v1d§(param1:Array) : void
      {
         var _loc4_:§_-wO§ = null;
         var _loc2_:Vector.<§_-3b§> = new Vector.<§_-3b§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-wO§(param1[_loc3_],this.team);
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         setData(_loc2_);
         this.§_-W1I§();
      }
      
      public function §_-Pr§(param1:int) : void
      {
         this.§_-L2y§ = param1;
         this.§_-W1I§();
      }
      
      override public function §_-Z1P§(param1:ListElementEvent) : void
      {
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      protected function §_-W1I§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.objects.length)
         {
            (this.objects[_loc1_] as §_-wO§).shaman = (this.objects[_loc1_] as §_-wO§).player.id == this.§_-L2y§;
            _loc1_++;
         }
      }
   }
}

