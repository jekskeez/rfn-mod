package §_-xm§
{
   import §_-Kr§.ScrollPane;
   import §_-dc§.Clan;
   import §_-dc§.§_-d1q§;
   import §_-e1G§.§_-T2R§;
   import §_-k1c§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-d1e§;
   
   public class §_-hX§ extends Dialog
   {
      
      private static const §_-Sc§:int = 0;
      
      private static const §_-KD§:int = 1;
      
      private static const §_-ig§:int = 2;
      
      private static const §_-X1X§:int = 3;
      
      private static const §_-z1O§:int = 85;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","text-align: center;","color: #000000;","}",".bold {","font-weight: bold;","font-size: 16px;","}",".level {","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var id:int = 255;
      
      private var §_-X2K§:int = 0;
      
      private var §_-M1N§:ScrollPane = null;
      
      private var §_-X1P§:Sprite = null;
      
      private var §_-fz§:DisplayObject = null;
      
      private var §_-jT§:Array = null;
      
      private var §_-81t§:Clan = null;
      
      private var §_-bH§:Boolean = false;
      
      private var §_-718§:Boolean = false;
      
      public function §_-hX§(param1:int, param2:Clan, param3:Boolean)
      {
         super(gls("Кладовая тотемов"));
         this.§_-X2K§ = param1;
         this.§_-81t§ = param2;
         this.§_-bH§ = param3;
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-g1B§();
      }
      
      public function get §_-11Z§() : Boolean
      {
         return this.§_-718§;
      }
      
      public function get §_-g2O§() : int
      {
         return this.§_-X2K§;
      }
      
      public function §_-Fp§(param1:int) : void
      {
         this.§_-X2K§ = param1;
         this.§_-GD§(this.§_-81t§.§_-G2I§.§_-j2U§(this.§_-X2K§));
      }
      
      private function init() : void
      {
         var _loc4_:TotemDescriptionBG = null;
         var _loc5_:§_-22V§ = null;
         var _loc6_:§_-22V§ = null;
         var _loc7_:Sprite = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:§_-22V§ = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:§_-d1e§ = null;
         this.style.parseCSS(§_-I2U§);
         this.§_-GD§(this.§_-81t§.§_-G2I§.§_-j2U§(this.§_-X2K§));
         this.§_-jT§ = [];
         var _loc1_:Sprite = new Sprite();
         this.§_-X1P§ = new Sprite();
         _loc1_.addChild(this.§_-X1P§);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < §_-d1q§.§_-c2§())
         {
            if(_loc3_ == §_-d1q§.§_-q1M§)
            {
               this.§_-jT§.push(null);
            }
            else
            {
               _loc4_ = new TotemDescriptionBG();
               _loc4_.x = 20;
               _loc4_.y = _loc2_ * §_-z1O§;
               _loc4_.addEventListener(MouseEvent.CLICK,this.§_-RF§);
               _loc4_.name = String(_loc3_);
               _loc4_.mouseEnabled = this.§_-bH§ || this.id == §_-d1q§.NONE;
               _loc4_.mouseChildren = this.§_-bH§ || this.id == §_-d1q§.NONE;
               this.§_-X1P§.addChild(_loc4_);
               _loc5_ = new §_-22V§("",94,_loc2_ * §_-z1O§ + 2,this.style);
               _loc5_.text = "<body><span class = \'bold\'>" + §_-d1q§.getName(_loc3_) + "</span></body>";
               _loc5_.width = 225;
               _loc5_.wordWrap = true;
               _loc5_.mouseEnabled = false;
               _loc5_.multiline = true;
               this.§_-X1P§.addChild(_loc5_);
               _loc6_ = new §_-22V§("",94,_loc2_ * §_-z1O§ + 20,this.style);
               _loc6_.text = "<body>" + §_-d1q§.§_-l7§(_loc3_) + "</body>";
               _loc6_.width = 225;
               _loc6_.wordWrap = true;
               _loc6_.multiline = true;
               _loc6_.mouseEnabled = false;
               this.§_-X1P§.addChild(_loc6_);
               _loc7_ = null;
               _loc8_ = §_-d1q§.§_-hw§(_loc3_);
               _loc9_ = new §_-22V§("",94,_loc2_ * §_-z1O§ + 68,this.style);
               _loc9_.text = gls("<body>Требуется <span class = \'level\'>{0}</span> уровень клана</body>",§_-d1q§.§_-A1x§(_loc3_));
               _loc9_.mouseEnabled = false;
               _loc9_.width = 225;
               _loc9_.wordWrap = true;
               _loc9_.multiline = true;
               this.§_-X1P§.addChild(_loc9_);
               _loc10_ = {};
               _loc11_ = this.§_-81t§.totems.§_-N2m§(_loc3_);
               if(_loc11_)
               {
                  _loc10_["state"] = §_-ig§;
                  _loc12_ = new §_-d1e§(205);
                  _loc12_.x = 100;
                  _loc12_.y = _loc2_ * §_-z1O§ + 68;
                  _loc12_.visible = false;
                  _loc12_.visible = true;
                  _loc12_.setExperience(_loc11_["level"],_loc11_["exp"],_loc11_["max_exp"]);
                  _loc10_["statusTotem"] = new §_-T2R§(_loc12_,§_-d1q§.§_-Oq§(_loc3_),_loc3_,_loc11_["level"],_loc11_["exp"],_loc11_["max_exp"]);
                  this.§_-X1P§.addChild(_loc12_);
                  _loc10_["totemProgress"] = _loc12_;
                  _loc6_.text = "<body>" + §_-d1q§.§_-l7§(_loc3_,_loc11_["bonus"]) + "</body>";
                  if(this.§_-81t§.§_-G2I§.§_-nz§(_loc3_) != §_-d1q§.NONE)
                  {
                     _loc10_["state"] = §_-X1X§;
                  }
               }
               if(§_-d1q§.§_-A1x§(_loc3_) > this.§_-81t§.level)
               {
                  _loc10_["state"] = §_-Sc§;
               }
               if(!("state" in _loc10_))
               {
                  _loc10_["state"] = §_-KD§;
               }
               if(_loc10_["state"] == §_-X1X§)
               {
                  _loc4_.mouseEnabled = false;
                  _loc4_.mouseChildren = false;
               }
               _loc10_["icon"] = _loc7_;
               _loc10_["itemBackground"] = _loc4_;
               _loc10_["availableItem"] = _loc8_;
               _loc10_["tipField"] = _loc9_;
               this.§_-jT§.push(_loc10_);
               this.§_-me§(_loc3_,_loc2_);
               _loc2_++;
            }
            _loc3_++;
         }
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.setSize(350,341);
         this.§_-M1N§.source = _loc1_;
         this.§_-M1N§.x = 276;
         this.§_-M1N§.y = 25;
         addChild(this.§_-M1N§);
         place();
         this.width = 650;
         this.height = 420;
      }
      
      public function §_-g1B§() : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:§_-d1e§ = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-d1q§.§_-c2§())
         {
            if(_loc2_ != §_-d1q§.§_-q1M§)
            {
               _loc3_ = this.§_-81t§.totems.§_-N2m§(_loc2_);
               _loc4_ = §_-KD§;
               if(_loc3_)
               {
                  if(!("totemProgress" in this.§_-jT§[_loc2_]))
                  {
                     _loc5_ = new §_-d1e§(205);
                     _loc5_.x = 100;
                     _loc5_.y = _loc1_ * §_-z1O§ + 68;
                     _loc5_.visible = false;
                     _loc5_.visible = true;
                     _loc5_.setExperience(_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     if("statusTotem" in this.§_-jT§[_loc2_])
                     {
                        this.§_-jT§[_loc2_]["statusTotem"].remove();
                     }
                     this.§_-jT§[_loc2_]["statusTotem"] = new §_-T2R§(_loc5_,§_-d1q§.§_-Oq§(_loc2_),_loc2_,_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     this.§_-X1P§.addChild(_loc5_);
                     this.§_-jT§[_loc2_]["totemProgress"] = _loc5_;
                  }
                  else
                  {
                     this.§_-jT§[_loc2_]["totemProgress"].setExperience(_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     if("statusTotem" in this.§_-jT§[_loc2_])
                     {
                        this.§_-jT§[_loc2_]["statusTotem"].remove();
                     }
                     this.§_-jT§[_loc2_]["statusTotem"] = new §_-T2R§(this.§_-jT§[_loc2_]["totemProgress"],§_-d1q§.§_-Oq§(_loc2_),_loc2_,_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                  }
                  _loc4_ = this.§_-81t§.§_-G2I§.§_-nz§(_loc2_) != §_-d1q§.NONE ? §_-X1X§ : §_-ig§;
               }
               if(§_-d1q§.§_-A1x§(_loc2_) > this.§_-81t§.level)
               {
                  _loc4_ = §_-Sc§;
               }
               if(this.§_-jT§[_loc2_]["state"] != _loc4_)
               {
                  this.§_-jT§[_loc2_]["state"] = _loc4_;
                  this.§_-me§(_loc2_,_loc1_);
               }
               _loc1_++;
            }
            _loc2_++;
         }
      }
      
      private function §_-me§(param1:int, param2:int) : void
      {
         if(this.§_-jT§[param1] == null)
         {
            return;
         }
         if(Boolean(this.§_-jT§[param1]["icon"]) && this.§_-X1P§.contains(this.§_-jT§[param1]["icon"]))
         {
            this.§_-X1P§.removeChild(this.§_-jT§[param1]["icon"]);
         }
         switch(this.§_-jT§[param1]["state"])
         {
            case §_-Sc§:
               this.§_-jT§[param1]["icon"] = new TotemItemCircleBlock();
               this.§_-jT§[param1]["icon"].x = 35;
               this.§_-jT§[param1]["icon"].y = param2 * §_-z1O§ + 13;
               this.§_-jT§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-jT§[param1]["itemBackground"].mouseChildren = false;
               this.§_-jT§[param1]["tipField"].visible = true;
               this.§_-jT§[param1]["availableItem"].visible = false;
               break;
            case §_-KD§:
               this.§_-jT§[param1]["icon"] = new TotemItemCircleImage();
               this.§_-jT§[param1]["icon"].x = 35;
               this.§_-jT§[param1]["icon"].y = param2 * §_-z1O§ + 13;
               this.§_-jT§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-jT§[param1]["itemBackground"].mouseChildren = false;
               this.§_-jT§[param1]["tipField"].visible = false;
               if(this.§_-jT§[param1]["availableItem"])
               {
                  this.§_-jT§[param1]["availableItem"].visible = false;
               }
               break;
            case §_-ig§:
               this.§_-jT§[param1]["itemBackground"].mouseEnabled = this.§_-bH§ || this.id == §_-d1q§.NONE;
               this.§_-jT§[param1]["itemBackground"].mouseChildren = this.§_-bH§ || this.id == §_-d1q§.NONE;
               this.§_-jT§[param1]["availableItem"].x = 47;
               this.§_-jT§[param1]["availableItem"].y = param2 * §_-z1O§ + 21;
               this.§_-jT§[param1]["availableItem"].visible = true;
               this.§_-jT§[param1]["icon"] = new TotemItemCircleImage();
               this.§_-jT§[param1]["icon"].x = 35;
               this.§_-jT§[param1]["icon"].y = param2 * §_-z1O§ + 13;
               this.§_-jT§[param1]["tipField"].visible = false;
               break;
            case §_-X1X§:
               this.§_-jT§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-jT§[param1]["itemBackground"].mouseChildren = false;
               this.§_-jT§[param1]["availableItem"].x = 47;
               this.§_-jT§[param1]["availableItem"].y = param2 * §_-z1O§ + 21;
               this.§_-jT§[param1]["availableItem"].visible = true;
               this.§_-jT§[param1]["icon"] = new SelectTotemItemCircle();
               this.§_-jT§[param1]["icon"].x = 31;
               this.§_-jT§[param1]["icon"].y = param2 * §_-z1O§ + 10;
               this.§_-jT§[param1]["tipField"].visible = false;
         }
         this.§_-jT§[param1]["icon"].mouseEnabled = false;
         this.§_-jT§[param1]["icon"].mouseChildren = false;
         this.§_-X1P§.addChild(this.§_-jT§[param1]["icon"]);
         if(this.§_-jT§[param1]["availableItem"])
         {
            (this.§_-jT§[param1]["availableItem"] as Sprite).mouseEnabled = false;
            (this.§_-jT§[param1]["availableItem"] as Sprite).mouseChildren = false;
            this.§_-X1P§.addChild(this.§_-jT§[param1]["availableItem"]);
         }
      }
      
      private function §_-GD§(param1:int) : void
      {
         this.id = param1;
         if(Boolean(this.§_-fz§) && Boolean(this.§_-fz§.parent))
         {
            this.§_-fz§.parent.removeChild(this.§_-fz§);
         }
         if(this.id != §_-d1q§.NONE)
         {
            this.§_-fz§ = §_-d1q§.§_-81e§(this.id);
         }
         else
         {
            this.§_-fz§ = new TotemBuy();
         }
         this.§_-fz§.x = 80;
         this.§_-fz§.y = 60;
         (this.§_-fz§ as Sprite).mouseEnabled = false;
         (this.§_-fz§ as Sprite).mouseChildren = false;
         this.§_-fz§.scaleX = this.§_-fz§.scaleY = 1.1;
         addChild(this.§_-fz§);
         if(this.§_-bH§ || !this.§_-jT§)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < §_-d1q§.§_-c2§())
         {
            if(_loc3_ != §_-d1q§.§_-q1M§)
            {
               this.§_-me§(_loc3_,_loc2_);
               _loc2_++;
            }
            _loc3_++;
         }
      }
      
      private function §_-RF§(param1:MouseEvent) : void
      {
         if(this.§_-jT§[param1.target.name]["state"] == §_-X1X§)
         {
            return;
         }
         this.§_-GD§(param1.target.name);
         Connection.§_-Li§(§_-h2B§.§_-O12§,this.§_-X2K§,param1.target.name);
         if(this.§_-bH§)
         {
            return;
         }
         hide();
         this.§_-718§ = true;
      }
   }
}

