package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import com.api.Player;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-XA§ extends §_-6Y§
   {
      
      private var §_-K2l§:§_-i1J§ = null;
      
      public function §_-XA§()
      {
         super(§_-6Y§.§_-U5§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         clear();
         var _loc2_:int = int(param1.length / 4);
         this.§_-wu§(_loc2_ == 0 ? 1 : _loc2_);
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = int(param1[_loc4_ * 4]);
            _loc7_ = int(param1[_loc4_ * 4 + 2]);
            _loc8_ = int(param1[_loc4_ * 4 + 3]);
            this.§_-53o§[_loc4_ * 4].text = String(_loc6_);
            this.§_-53o§[_loc4_ * 4 + 1].text = String(_loc7_);
            this.§_-53o§[_loc4_ * 4 + 2].text = this.§_-4s§(_loc7_);
            this.§_-53o§[_loc4_ * 4 + 3].text = String(_loc8_);
            if(this.§_-53o§[_loc4_ * 4 + 2].text == "")
            {
               _loc3_.push(_loc7_);
            }
            _loc4_++;
         }
         var _loc5_:int = _loc2_ * 4;
         while(_loc5_ < this.§_-53o§.length)
         {
            this.§_-53o§[_loc5_].text = "";
            this.§_-53o§[_loc5_ + 1].text = "";
            this.§_-53o§[_loc5_ + 2].text = "";
            this.§_-53o§[_loc5_ + 3].text = "";
            _loc5_ += 4;
         }
         if(_loc3_.length > 0)
         {
            Game.request(_loc3_,§_-hF§.§_-31q§,true);
         }
         this.§_-p2Z§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = this.§_-L1P§;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = this.§_-53o§[_loc3_ * 4].text;
            _loc6_ = this.§_-53o§[_loc3_ * 4 + 1].text;
            _loc7_ = this.§_-53o§[_loc3_ * 4 + 3].text;
            if(_loc5_ != "")
            {
               _loc1_.push([int(_loc5_),int(_loc6_),int(_loc7_)]);
            }
            _loc3_++;
         }
         var _loc4_:§_-U1M§ = new §_-U1M§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-s15§(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_.§_-s15§(_loc1_[_loc3_][0]);
            _loc4_.§_-s15§(_loc1_[_loc3_][1]);
            _loc4_.§_-s15§(_loc1_[_loc3_][2]);
            _loc3_++;
         }
         return _loc4_;
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
         return this.§_-53o§.length / 4;
      }
      
      private function §_-wu§(param1:int) : void
      {
         while(this.§_-L1P§ < param1)
         {
            this.§_-22N§ = 0;
            §_-01s§("GiftID",80);
            §_-01s§("SenderID",80);
            §_-01s§("Имя",170,false);
            §_-01s§("Time",100);
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
         this.§_-K2l§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить подарок</a></body>",0,0,§_-32A§.style);
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
      
      private function §_-y2I§() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-L1P§)
         {
            _loc3_ = this.§_-53o§[_loc2_ * 4 + 1].text;
            if(_loc3_ == "")
            {
               this.§_-53o§[_loc2_ * 4 + 2].text = "";
            }
            else
            {
               _loc4_ = int(_loc3_);
               _loc5_ = this.§_-4s§(_loc4_);
               this.§_-53o§[_loc2_ * 4 + 2].text = _loc5_;
               if(_loc5_ == "")
               {
                  _loc1_.push(_loc4_);
               }
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            Game.request(_loc1_,§_-hF§.§_-31q§,true);
         }
      }
      
      private function §_-4s§(param1:int) : String
      {
         var _loc2_:Player = Game.getPlayer(param1);
         if(_loc2_ == null || !_loc2_.isLoaded(§_-hF§.§_-31q§))
         {
            return "";
         }
         return _loc2_.name;
      }
   }
}

