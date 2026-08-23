package §_-X1o§
{
   import §_-5C§.ListDataEvent;
   import §_-5C§.ListElementEvent;
   
   public class §_-o1a§ extends §_-93Q§
   {
      
      protected var §_-616§:int = -1;
      
      protected var team:int;
      
      public function §_-o1a§(param1:int = 2)
      {
         super();
         this.team = param1;
      }
      
      public function §_-73o§(param1:int) : void
      {
         var _loc2_:§_-D2I§ = new §_-D2I§(param1,this.team);
         if(this.§_-616§ == param1)
         {
            _loc2_.shaman = true;
         }
         §_-yA§(_loc2_);
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-I2W§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.objects.length)
         {
            if((this.objects[_loc2_] as §_-D2I§).player.id == param1)
            {
               this.objects[_loc2_].removeEventListener(ListElementEvent.CHANGED,this.§_-YC§);
               this.objects.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
         if(param1 == this.§_-616§)
         {
            this.§_-616§ = -1;
         }
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      public function §_-S2z§(param1:Array) : void
      {
         var _loc4_:§_-D2I§ = null;
         var _loc2_:Vector.<§_-X27§> = new Vector.<§_-X27§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = new §_-D2I§(param1[_loc3_],this.team);
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         setData(_loc2_);
         this.§_-Fi§();
      }
      
      public function §_-23L§(param1:int) : void
      {
         this.§_-616§ = param1;
         this.§_-Fi§();
      }
      
      override public function §_-YC§(param1:ListElementEvent) : void
      {
         dispatchEvent(new ListDataEvent(ListDataEvent.UPDATE,this));
      }
      
      protected function §_-Fi§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.objects.length)
         {
            (this.objects[_loc1_] as §_-D2I§).shaman = (this.objects[_loc1_] as §_-D2I§).player.id == this.§_-616§;
            _loc1_++;
         }
      }
   }
}

