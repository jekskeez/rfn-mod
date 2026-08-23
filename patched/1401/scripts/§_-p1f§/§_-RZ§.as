package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-RZ§ extends §_-6Y§
   {
      
      private var §_-C3c§:§_-i1J§ = null;
      
      public function §_-RZ§(param1:int = -1)
      {
         super(param1 < 0 ? §_-6Y§.§_-aS§ : param1);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         clear();
         this.§_-X26§();
         if(param1 == null)
         {
            return;
         }
         this.§_-53o§[0].text = String(param1[0]);
         this.§_-53o§[1].text = String(param1[1]);
         this.§_-53o§[2].text = String(param1[2]);
         this.§_-53o§[3].text = String(param1[3]);
         var _loc2_:Array = param1.length > 4 ? param1[4] as Array : null;
         if(_loc2_ != null)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ + 1 < _loc2_.length)
            {
               this.§_-c2L§(_loc3_ + 1);
               this.§_-53o§[4 + _loc3_ * 2].text = String(_loc2_[_loc4_]);
               this.§_-53o§[4 + _loc3_ * 2 + 1].text = String(_loc2_[_loc4_ + 1]);
               _loc3_++;
               _loc4_ += 2;
            }
         }
         this.§_-c1r§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc4_:String = null;
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(int(this.§_-53o§[0].text));
         _loc1_.§_-s15§(int(this.§_-53o§[1].text));
         _loc1_.§_-s15§(int(this.§_-53o§[2].text));
         _loc1_.§_-s15§(int(this.§_-53o§[3].text));
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-Q28§)
         {
            _loc4_ = this.§_-53o§[4 + _loc3_ * 2].text;
            if(_loc4_ != "")
            {
               _loc2_.push(int(_loc4_),int(this.§_-53o§[4 + _loc3_ * 2 + 1].text));
            }
            _loc3_++;
         }
         _loc1_.§_-s15§(_loc2_.length * 0.5);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_.§_-s15§(_loc2_[_loc3_]);
            _loc1_.§_-s15§(_loc2_[_loc3_ + 1]);
            _loc3_ += 2;
         }
         return _loc1_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Sw§();
      }
      
      override protected function get fieldList() : Array
      {
         return ["Сезон","Очки всего","Очки сезона","ID дивизиона"];
      }
      
      override protected function get fieldWidth() : int
      {
         return 120;
      }
      
      override protected function §_-X26§() : void
      {
         super.§_-X26§();
         this.§_-c2L§(1);
         this.§_-c1r§();
      }
      
      private function get §_-Q28§() : int
      {
         return Math.max(0,(this.§_-53o§.length - 4) * 0.5);
      }
      
      private function §_-c2L§(param1:int) : void
      {
         while(this.§_-Q28§ < param1)
         {
            this.§_-22N§ = 0;
            this.§_-uH§ = int(this.§_-HL§.y + this.§_-HL§.height);
            §_-01s§("Сезон (ист.)",55);
            §_-01s§("Очки (ист.)",70);
            this.§_-uH§ += 25;
         }
         this.§_-c1r§();
      }
      
      private function §_-Sw§() : void
      {
         if(this.§_-C3c§ != null)
         {
            return;
         }
         this.§_-C3c§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить запись истории</a></body>",0,0,§_-32A§.style);
         this.§_-C3c§.addEventListener(MouseEvent.CLICK,this.§_-G1B§);
         this.§_-c1r§();
      }
      
      private function §_-c1r§() : void
      {
         if(!this.§_-C3c§)
         {
            return;
         }
         this.§_-C3c§.x = 0;
         this.§_-C3c§.y = this.§_-53o§.length == 0 ? 0 : int(this.§_-HL§.y + this.§_-HL§.height + 8);
         if(this.§_-C3c§.parent != this)
         {
            addChild(this.§_-C3c§);
         }
      }
      
      private function §_-G1B§(param1:MouseEvent) : void
      {
         this.§_-c2L§(this.§_-Q28§ + 1);
         §_-Hp§(param1);
      }
   }
}

