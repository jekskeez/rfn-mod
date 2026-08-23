package §_-p1f§
{
   import §_-I10§.§_-g2W§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import flash.utils.getTimer;
   import protocol.§_-U1M§;
   import utils.§_-ex§;
   
   public class §_-x1q§ extends §_-6Y§
   {
      
      private var values:Object = {};
      
      public function §_-x1q§()
      {
         super(§_-6Y§.§_-j2r§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.values[param1[_loc2_]] = {
               "level":param1[_loc2_ + 1],
               "time":param1[_loc2_ + 2],
               "worn":param1[_loc2_ + 3],
               "slot":param1[_loc2_ + 4],
               "reason":param1[_loc2_ + 5]
            };
            _loc2_ += 6;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-g2W§.§_-21d§ - 7)
         {
            this.§_-MO§[_loc2_ * 2].selected = _loc2_ in this.values;
            this.§_-MO§[_loc2_ * 2 + 1].selected = _loc2_ in this.values && this.values[_loc2_]["worn"] != 0;
            this.§_-53o§[_loc2_ * 5].text = _loc2_ in this.values ? this.values[_loc2_]["level"] : "0";
            this.§_-53o§[_loc2_ * 5 + 1].text = _loc2_ in this.values ? this.values[_loc2_]["reason"] : "0";
            this.§_-53o§[_loc2_ * 5 + 2].text = _loc2_ in this.values ? this.values[_loc2_]["slot"] : "0";
            if(this.§_-53o§[_loc2_ * 5 + 3] != null)
            {
               _loc3_ = _loc2_ in this.values ? int(this.values[_loc2_]["time"]) : 0;
               if(_loc3_ > 0)
               {
                  _loc3_ -= Game.§_-nE§ + int(getTimer() / 1000);
               }
               this.§_-53o§[_loc2_ * 5 + 3].text = _loc3_.toString();
               this.§_-53o§[_loc2_ * 5 + 4].text = §_-ex§.§_-d2X§(_loc3_);
            }
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:String = null;
         var _loc4_:§_-U1M§ = null;
         this.values = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-g2W§.§_-21d§ - 7)
         {
            if(this.§_-MO§[_loc1_ * 2].selected)
            {
               this.values[_loc1_] = {};
               this.values[_loc1_]["worn"] = this.§_-MO§[_loc1_ * 2 + 1].selected ? 1 : 0;
               this.values[_loc1_]["level"] = int(this.§_-53o§[_loc1_ * 5].text);
               this.values[_loc1_]["reason"] = int(this.§_-53o§[_loc1_ * 5 + 1].text);
               this.values[_loc1_]["slot"] = int(this.§_-53o§[_loc1_ * 5 + 2].text);
               if(this.§_-53o§[_loc1_ * 5 + 3] == null)
               {
                  this.values[_loc1_]["time"] = 0;
               }
               else
               {
                  this.values[_loc1_]["time"] = int(this.§_-53o§[_loc1_ * 5 + 3].text);
               }
            }
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-U1M§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-s15§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.§_-s15§(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]["level"]);
            if(this.values[_loc3_]["time"] == 0)
            {
               _loc4_.§_-s15§(this.values[_loc3_]["time"]);
            }
            else
            {
               _loc4_.§_-s15§(this.values[_loc3_]["time"] + Game.§_-nE§ + int(getTimer() / 1000));
            }
            _loc4_.writeByte(this.values[_loc3_]["worn"]);
            _loc4_.§_-s15§(this.values[_loc3_]["slot"]);
            _loc4_.writeByte(this.values[_loc3_]["reason"]);
         }
         return _loc4_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-g2W§.§_-21d§ - 7)
         {
            §_-c1H§(§_-g2W§.§_-G1Y§(_loc1_));
            §_-c1H§("Надет");
            §_-01s§("Уровень",25);
            §_-01s§("Причина",25);
            §_-01s§("Слот",25,false);
            this.§_-22N§ = 0;
            this.§_-uH§ += 25;
            §_-01s§("Время",100);
            this.§_-53o§[this.§_-53o§.length - 1].name = _loc1_.toString();
            this.§_-53o§[this.§_-53o§.length - 1].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-52t§);
            §_-01s§("Окончание ",125,false);
            _loc1_++;
         }
      }
      
      override protected function get checkTitleWidth() : int
      {
         return this.§_-MO§.length % 2 == 0 ? 125 : 0;
      }
      
      private function §_-52t§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         this.§_-53o§[_loc2_ * 5 + 4].text = §_-ex§.§_-d2X§(int(param1.currentTarget.text));
         if(int(param1.currentTarget.text) != 0)
         {
            this.§_-MO§[_loc2_ * 2].selected = true;
         }
      }
   }
}

