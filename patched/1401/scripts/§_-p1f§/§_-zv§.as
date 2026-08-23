package §_-p1f§
{
   import §_-I10§.§_-ct§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import §_-vK§.§_-QC§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-zv§ extends §_-6Y§
   {
      
      private static const §_-724§:int = 1;
      
      private static const §_-lU§:int = 2;
      
      private static const §_-91s§:int = 4;
      
      private static const §_-lM§:int = 5;
      
      private var level:uint = 0;
      
      private var experience:uint = 0;
      
      private var §_-s25§:uint = 0;
      
      private var §_-11v§:uint = 0;
      
      private var branch:uint = 0;
      
      private var skills:Object = {};
      
      private var §_-u2h§:Array = [];
      
      public function §_-zv§()
      {
         super(§_-6Y§.§_-S2i§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.level = int(param1[0]);
         this.experience = int(param1[1]);
         this.§_-s25§ = int(param1[2]);
         this.§_-11v§ = int(param1[3]);
         this.branch = int(param1[4]);
         this.§_-53o§[0].text = this.level.toString();
         this.§_-53o§[1].text = this.experience.toString();
         this.§_-53o§[2].text = this.§_-s25§.toString();
         this.§_-53o§[3].text = this.branch.toString();
         this.§_-MO§[0].selected = (this.§_-11v§ & §_-724§) != 0;
         this.§_-MO§[1].selected = (this.§_-11v§ & §_-lU§) != 0;
         this.§_-MO§[2].selected = (this.§_-11v§ & §_-91s§) != 0;
         this.skills = {};
         var _loc2_:Array = param1[5];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc5_ = int(_loc2_[_loc3_]);
            this.skills[_loc5_] = {
               "free_level":_loc2_[_loc3_ + 1],
               "paid_level":_loc2_[_loc3_ + 2]
            };
            _loc3_ += 3;
         }
         var _loc4_:int = 4;
         _loc3_ = 0;
         while(_loc3_ < this.§_-u2h§.length)
         {
            _loc6_ = int(this.§_-u2h§[_loc3_]);
            if(_loc6_ in this.skills)
            {
               this.§_-53o§[_loc4_].text = this.skills[_loc6_]["free_level"].toString();
               this.§_-53o§[_loc4_ + 1].text = this.skills[_loc6_]["paid_level"].toString();
            }
            else
            {
               this.§_-53o§[_loc4_].text = "0";
               this.§_-53o§[_loc4_ + 1].text = "0";
            }
            _loc4_ += 2;
            _loc3_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.level = int(this.§_-53o§[0].text);
         this.experience = int(this.§_-53o§[1].text);
         this.§_-s25§ = int(this.§_-53o§[2].text);
         this.branch = int(this.§_-53o§[3].text);
         this.§_-11v§ = 0;
         if(this.§_-MO§[0].selected)
         {
            this.§_-11v§ |= §_-724§;
         }
         if(this.§_-MO§[1].selected)
         {
            this.§_-11v§ |= §_-lU§;
         }
         if(this.§_-MO§[2].selected)
         {
            this.§_-11v§ |= §_-91s§;
         }
         var _loc1_:Array = [];
         var _loc2_:int = 4;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-u2h§.length)
         {
            _loc6_ = int(this.§_-u2h§[_loc3_]);
            _loc7_ = int(this.§_-53o§[_loc2_].text);
            _loc8_ = int(this.§_-53o§[_loc2_ + 1].text);
            if(_loc7_ > 0 || _loc8_ > 0)
            {
               _loc1_.push(_loc6_);
               _loc1_.push(_loc7_);
               _loc1_.push(_loc8_);
            }
            _loc2_ += 2;
            _loc3_++;
         }
         var _loc4_:§_-U1M§ = new §_-U1M§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.writeByte(this.level);
         _loc4_.§_-s15§(this.experience);
         _loc4_.writeByte(this.§_-s25§);
         _loc4_.writeByte(this.§_-11v§);
         _loc4_.writeByte(this.branch);
         var _loc5_:int = _loc1_.length / 3;
         _loc4_.§_-s15§(_loc5_);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_.§_-s15§(_loc1_[_loc3_]);
            _loc4_.writeByte(_loc1_[_loc3_ + 1]);
            _loc4_.writeByte(_loc1_[_loc3_ + 2]);
            _loc3_ += 3;
         }
         return _loc4_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:§_-i1J§ = null;
         var _loc9_:§_-i1J§ = null;
         var _loc10_:int = 0;
         §_-01s§("Уровень",50);
         §_-01s§("Опыт",80);
         §_-01s§("Перья",50);
         §_-01s§("Активная ветка",50);
         this.§_-22N§ = 0;
         this.§_-uH§ += 25;
         this.§_-HL§.addChild(new §_-i1J§("Купленные ветки:",0,this.§_-uH§,§_-32A§.§_-hP§));
         this.§_-uH§ += 25;
         §_-c1H§(§_-ct§.§_-t1c§[§_-ct§.§_-Te§]);
         §_-c1H§(§_-ct§.§_-t1c§[§_-ct§.§_-e2p§]);
         §_-c1H§(§_-ct§.§_-t1c§[§_-ct§.§_-pO§]);
         this.§_-22N§ = 0;
         this.§_-uH§ += 25;
         this.§_-u2h§ = [];
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-ct§.§_-i1§.length)
         {
            _loc4_ = §_-ct§.§_-i1§[_loc2_];
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = int(_loc4_[_loc5_]);
               _loc7_ = this.§_-l2E§(_loc6_);
               _loc8_ = new §_-i1J§(_loc7_,0,0,§_-32A§.§_-53t§);
               if(_loc8_.textWidth > _loc1_)
               {
                  _loc1_ = _loc8_.textWidth;
               }
               _loc5_++;
            }
            _loc2_++;
         }
         var _loc3_:int = _loc1_ + §_-lM§;
         _loc2_ = 0;
         while(_loc2_ < §_-ct§.§_-i1§.length)
         {
            _loc4_ = §_-ct§.§_-i1§[_loc2_];
            if(_loc4_.length > 0)
            {
               this.§_-HL§.addChild(new §_-i1J§(§_-ct§.§_-t1c§[_loc2_] + ":",0,this.§_-uH§,§_-32A§.§_-hP§));
               this.§_-uH§ += 25;
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = int(_loc4_[_loc5_]);
                  this.§_-u2h§.push(_loc6_);
                  _loc7_ = this.§_-l2E§(_loc6_);
                  _loc9_ = new §_-i1J§(_loc7_,0,this.§_-uH§,§_-32A§.§_-53t§);
                  this.§_-HL§.addChild(_loc9_);
                  _loc10_ = _loc3_;
                  _loc10_ = this.§_-aW§("Free",_loc10_,this.§_-uH§);
                  _loc10_ = this.§_-aW§("Paid",_loc10_,this.§_-uH§);
                  this.§_-22N§ = 0;
                  this.§_-uH§ += 25;
                  _loc5_++;
               }
            }
            _loc2_++;
         }
      }
      
      override protected function get fieldTitleWidth() : int
      {
         return 150;
      }
      
      private function §_-l2E§(param1:int) : String
      {
         if(param1 in §_-QC§.perkData && Boolean(§_-QC§.perkData[param1]["name"]))
         {
            return §_-QC§.perkData[param1]["name"];
         }
         return "Skill " + param1;
      }
      
      private function §_-aW§(param1:String, param2:int, param3:int) : int
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc5_:TextField = new TextField();
         _loc5_.selectable = true;
         _loc5_.mouseEnabled = true;
         _loc5_.addEventListener(Event.CHANGE,§_-Hp§);
         §_-43M§.§_-22h§(_loc5_,_loc4_,_loc4_.width + 2,0,30,18,100,true);
         _loc4_.addChild(_loc5_);
         _loc4_.x = param2;
         _loc4_.y = param3;
         this.§_-HL§.addChild(_loc4_);
         this.§_-53o§.push(_loc5_);
         return param2 + _loc4_.width + §_-lM§;
      }
   }
}

