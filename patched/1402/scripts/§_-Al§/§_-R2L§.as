package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-R2L§ extends §_-K1K§
   {
      
      private var §_-Cm§:§_-y1B§ = null;
      
      public function §_-R2L§(param1:int = -1)
      {
         super(param1 < 0 ? §_-K1K§.§_-qV§ : param1);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         clear();
         this.§_-c1v§();
         if(param1 == null)
         {
            return;
         }
         this.§_-23Z§[0].text = String(param1[0]);
         this.§_-23Z§[1].text = String(param1[1]);
         this.§_-23Z§[2].text = String(param1[2]);
         this.§_-23Z§[3].text = String(param1[3]);
         var _loc2_:Array = param1.length > 4 ? param1[4] as Array : null;
         if(_loc2_ != null)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ + 1 < _loc2_.length)
            {
               this.§_-715§(_loc3_ + 1);
               this.§_-23Z§[4 + _loc3_ * 2].text = String(_loc2_[_loc4_]);
               this.§_-23Z§[4 + _loc3_ * 2 + 1].text = String(_loc2_[_loc4_ + 1]);
               _loc3_++;
               _loc4_ += 2;
            }
         }
         this.§_-Ve§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc4_:String = null;
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(int(this.§_-23Z§[0].text));
         _loc1_.§_-C1W§(int(this.§_-23Z§[1].text));
         _loc1_.§_-C1W§(int(this.§_-23Z§[2].text));
         _loc1_.§_-C1W§(int(this.§_-23Z§[3].text));
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-812§)
         {
            _loc4_ = this.§_-23Z§[4 + _loc3_ * 2].text;
            if(_loc4_ != "")
            {
               _loc2_.push(int(_loc4_),int(this.§_-23Z§[4 + _loc3_ * 2 + 1].text));
            }
            _loc3_++;
         }
         _loc1_.§_-C1W§(_loc2_.length * 0.5);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.§_-C1W§(_loc2_[_loc3_]);
            _loc1_.§_-C1W§(_loc2_[_loc3_ + 1]);
            _loc3_ += 2;
         }
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-52u§();
      }
      
      override protected function get fieldList() : Array
      {
         return ["Сезон","Очки всего","Очки сезона","ID дивизиона"];
      }
      
      override protected function get fieldWidth() : int
      {
         return 120;
      }
      
      override protected function §_-c1v§() : void
      {
         super.§_-c1v§();
         this.§_-715§(1);
         this.§_-Ve§();
      }
      
      private function get §_-812§() : int
      {
         return Math.max(0,(this.§_-23Z§.length - 4) * 0.5);
      }
      
      private function §_-715§(param1:int) : void
      {
         while(this.§_-812§ < param1)
         {
            this.§_-t1o§ = 0;
            this.§_-J1E§ = int(this.§_-2H§.y + this.§_-2H§.height);
            §_-HE§("Сезон (ист.)",55);
            §_-HE§("Очки (ист.)",70);
            this.§_-J1E§ += 25;
         }
         this.§_-Ve§();
      }
      
      private function §_-52u§() : void
      {
         if(this.§_-Cm§ != null)
         {
            return;
         }
         this.§_-Cm§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить запись истории</a></body>",0,0,§_-A3G§.style);
         this.§_-Cm§.addEventListener(MouseEvent.CLICK,this.§_-a1k§);
         this.§_-Ve§();
      }
      
      private function §_-Ve§() : void
      {
         if(!this.§_-Cm§)
         {
            return;
         }
         this.§_-Cm§.x = 0;
         this.§_-Cm§.y = this.§_-23Z§.length == 0 ? 0 : int(this.§_-2H§.y + this.§_-2H§.height + 8);
         if(this.§_-Cm§.parent != this)
         {
            addChild(this.§_-Cm§);
         }
      }
      
      private function §_-a1k§(param1:MouseEvent) : void
      {
         this.§_-715§(this.§_-812§ + 1);
         §_-w1T§(param1);
      }
   }
}

