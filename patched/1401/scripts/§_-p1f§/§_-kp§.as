package §_-p1f§
{
   import §_-dc§.§_-d1q§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import §_-l26§.§_-z2g§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-kp§ extends §_-6Y§
   {
      
      private static const §_-qA§:int = 4;
      
      private var §_-K2l§:§_-i1J§ = null;
      
      public function §_-kp§()
      {
         super(§_-z2g§.§_-TZ§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         clear();
         var _loc2_:Array = param1 is Array ? param1 as Array : (param1 != null ? param1.slots as Array : null);
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         var _loc3_:int = _loc2_.length / 3;
         this.§_-wu§(_loc3_ == 0 ? 1 : _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = int(_loc2_[_loc4_ * 3]);
            _loc6_ = int(_loc2_[_loc4_ * 3 + 2]);
            this.§_-53o§[_loc4_ * §_-qA§].text = String(_loc5_);
            this.§_-53o§[_loc4_ * §_-qA§ + 1].text = String(_loc2_[_loc4_ * 3 + 1]);
            this.§_-53o§[_loc4_ * §_-qA§ + 2].text = String(_loc6_);
            this.§_-53o§[_loc4_ * §_-qA§ + 3].text = this.§_-y2s§(_loc6_);
            _loc4_++;
         }
         this.§_-p2Z§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-L1P§)
         {
            _loc4_ = this.§_-53o§[_loc2_ * §_-qA§].text;
            _loc5_ = this.§_-53o§[_loc2_ * §_-qA§ + 1].text;
            _loc6_ = this.§_-53o§[_loc2_ * §_-qA§ + 2].text;
            if(!(_loc4_ == "" || _loc6_ == ""))
            {
               _loc1_.push([int(_loc4_),int(_loc5_),int(_loc6_)]);
            }
            _loc2_++;
         }
         var _loc3_:§_-U1M§ = new §_-U1M§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-s15§(_loc1_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_.writeByte(_loc1_[_loc2_][0]);
            _loc3_.§_-s15§(_loc1_[_loc2_][1]);
            _loc3_.writeByte(_loc1_[_loc2_][2]);
            _loc2_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-t2X§();
      }
      
      override protected function §_-X26§() : void
      {
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      override protected function §_-Hp§(param1:Event) : void
      {
         super.§_-Hp§(param1);
         this.§_-y2I§();
      }
      
      private function get §_-L1P§() : int
      {
         return this.§_-53o§.length / §_-qA§;
      }
      
      private function §_-wu§(param1:int) : void
      {
         while(this.§_-L1P§ < param1)
         {
            this.§_-22N§ = 0;
            §_-01s§("Слот",30);
            §_-01s§("Истекает",100);
            §_-01s§("Тотем",30);
            §_-01s§("Имя",120,false);
            this.§_-uH§ += 25;
         }
         this.§_-p2Z§();
         dispatchEvent(new Event("change"));
      }
      
      private function §_-y2I§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-L1P§)
         {
            this.§_-53o§[_loc1_ * §_-qA§ + 3].text = this.§_-y2s§(int(this.§_-53o§[_loc1_ * §_-qA§ + 2].text));
            _loc1_++;
         }
      }
      
      private function §_-y2s§(param1:int) : String
      {
         var _loc2_:String = §_-d1q§.getName(param1);
         return _loc2_ != null ? _loc2_ : (param1 == §_-d1q§.NONE ? "Пусто" : "Тотем " + param1);
      }
      
      private function §_-t2X§() : void
      {
         if(this.§_-K2l§ != null)
         {
            return;
         }
         this.§_-K2l§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить слот</a></body>",0,0,§_-32A§.style);
         this.§_-K2l§.addEventListener(MouseEvent.CLICK,this.§_-d4§);
         this.§_-p2Z§();
      }
      
      private function §_-p2Z§() : void
      {
         if(!this.§_-K2l§)
         {
            return;
         }
         this.§_-K2l§.x = 0;
         this.§_-K2l§.y = this.§_-L1P§ == 0 ? 0 : this.§_-HL§.height;
         addChild(this.§_-K2l§);
      }
      
      private function §_-d4§(param1:MouseEvent) : void
      {
         this.§_-wu§(this.§_-L1P§ + 1);
      }
   }
}

