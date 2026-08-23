package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-A3b§ extends §_-6Y§
   {
      
      private var values:Object = {};
      
      private var §_-K2l§:§_-i1J§ = null;
      
      public function §_-A3b§()
      {
         super(§_-6Y§.§_-w2A§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         clear();
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc6_ = int(param1[_loc2_]);
            _loc7_ = int(param1[_loc2_ + 1]);
            if(_loc6_ > 0)
            {
               this.values[_loc6_] = _loc7_;
            }
            _loc2_ += 2;
         }
         var _loc3_:int = 0;
         for(_loc4_ in this.values)
         {
            if(_loc3_ >= this.§_-L1P§)
            {
               this.§_-wu§(_loc3_ + 1);
            }
            this.§_-53o§[_loc3_ * 2].text = _loc4_;
            this.§_-53o§[_loc3_ * 2 + 1].text = this.values[_loc4_].toString();
            _loc3_++;
         }
         _loc5_ = _loc3_ * 2;
         while(_loc5_ < this.§_-53o§.length)
         {
            this.§_-53o§[_loc5_].text = "";
            _loc5_++;
         }
         this.§_-p2Z§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc4_:String = null;
         var _loc5_:§_-U1M§ = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.values = {};
         var _loc1_:int = this.§_-L1P§;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc6_ = this.§_-53o§[_loc2_ * 2].text;
            _loc7_ = this.§_-53o§[_loc2_ * 2 + 1].text;
            _loc8_ = int(_loc6_);
            _loc9_ = int(_loc7_);
            if(_loc8_ > 0)
            {
               this.values[_loc8_] = _loc9_;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         for(_loc4_ in this.values)
         {
            _loc3_++;
         }
         _loc5_ = new §_-U1M§();
         _loc5_.endian = Endian.LITTLE_ENDIAN;
         _loc5_.§_-s15§(_loc3_);
         for(_loc4_ in this.values)
         {
            _loc5_.§_-s15§(int(_loc4_));
            _loc5_.§_-s15§(this.values[_loc4_]);
         }
         return _loc5_;
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
      
      override protected function get fieldWidth() : int
      {
         return 70;
      }
      
      private function get §_-L1P§() : int
      {
         return this.§_-53o§.length * 0.5;
      }
      
      private function §_-wu§(param1:int) : void
      {
         while(this.§_-L1P§ < param1)
         {
            this.§_-22N§ = 0;
            §_-01s§("ID",this.fieldWidth);
            §_-01s§("Кол-во",this.fieldWidth);
            this.§_-uH§ += 25;
         }
         this.§_-p2Z§();
         dispatchEvent(new Event("change"));
      }
      
      private function §_-t2X§() : void
      {
         if(this.§_-K2l§ != null)
         {
            return;
         }
         this.§_-K2l§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить награду</a></body>",0,0,§_-32A§.style);
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

