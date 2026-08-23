package §_-I18§
{
   import §_-B1G§.ScrollPane;
   import §_-S1n§.§_-02M§;
   import §_-U19§.Clan;
   import §_-U19§.§_-su§;
   import §_-bN§.Dialog;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-u1G§;
   
   public class §_-D1n§ extends Dialog
   {
      
      private static const §_-F1C§:int = 0;
      
      private static const §_-k2M§:int = 1;
      
      private static const §_-ah§:int = 2;
      
      private static const §_-t22§:int = 3;
      
      private static const §_-H2K§:int = 85;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","text-align: center;","color: #000000;","}",".bold {","font-weight: bold;","font-size: 16px;","}",".level {","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var id:int = 255;
      
      private var §_-l1t§:int = 0;
      
      private var §_-W18§:ScrollPane = null;
      
      private var §_-p2y§:Sprite = null;
      
      private var §_-uG§:DisplayObject = null;
      
      private var §_-DD§:Array = null;
      
      private var §_-b19§:Clan = null;
      
      private var §_-I1B§:Boolean = false;
      
      private var §_-I1M§:Boolean = false;
      
      public function §_-D1n§(param1:int, param2:Clan, param3:Boolean)
      {
         super(gls("Кладовая тотемов"));
         this.§_-l1t§ = param1;
         this.§_-b19§ = param2;
         this.§_-I1B§ = param3;
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-m19§();
      }
      
      public function get §_-015§() : Boolean
      {
         return this.§_-I1M§;
      }
      
      public function get §_-G1J§() : int
      {
         return this.§_-l1t§;
      }
      
      public function §_-9Q§(param1:int) : void
      {
         this.§_-l1t§ = param1;
         this.§_-mV§(this.§_-b19§.§_-Af§.§_-y21§(this.§_-l1t§));
      }
      
      private function init() : void
      {
         var _loc4_:TotemDescriptionBG = null;
         var _loc5_:§_-i5§ = null;
         var _loc6_:§_-i5§ = null;
         var _loc7_:Sprite = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:§_-i5§ = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:§_-u1G§ = null;
         this.style.parseCSS(§_-aD§);
         this.§_-mV§(this.§_-b19§.§_-Af§.§_-y21§(this.§_-l1t§));
         this.§_-DD§ = [];
         var _loc1_:Sprite = new Sprite();
         this.§_-p2y§ = new Sprite();
         _loc1_.addChild(this.§_-p2y§);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < §_-su§.§_-B3a§())
         {
            if(_loc3_ == §_-su§.§_-y3§)
            {
               this.§_-DD§.push(null);
            }
            else
            {
               _loc4_ = new TotemDescriptionBG();
               _loc4_.x = 20;
               _loc4_.y = _loc2_ * §_-H2K§;
               _loc4_.addEventListener(MouseEvent.CLICK,this.§_-N5§);
               _loc4_.name = String(_loc3_);
               _loc4_.mouseEnabled = this.§_-I1B§ || this.id == §_-su§.NONE;
               _loc4_.mouseChildren = this.§_-I1B§ || this.id == §_-su§.NONE;
               this.§_-p2y§.addChild(_loc4_);
               _loc5_ = new §_-i5§("",94,_loc2_ * §_-H2K§ + 2,this.style);
               _loc5_.text = "<body><span class = \'bold\'>" + §_-su§.getName(_loc3_) + "</span></body>";
               _loc5_.width = 225;
               _loc5_.wordWrap = true;
               _loc5_.mouseEnabled = false;
               _loc5_.multiline = true;
               this.§_-p2y§.addChild(_loc5_);
               _loc6_ = new §_-i5§("",94,_loc2_ * §_-H2K§ + 20,this.style);
               _loc6_.text = "<body>" + §_-su§.§_-ya§(_loc3_) + "</body>";
               _loc6_.width = 225;
               _loc6_.wordWrap = true;
               _loc6_.multiline = true;
               _loc6_.mouseEnabled = false;
               this.§_-p2y§.addChild(_loc6_);
               _loc7_ = null;
               _loc8_ = §_-su§.§_-C2h§(_loc3_);
               _loc9_ = new §_-i5§("",94,_loc2_ * §_-H2K§ + 68,this.style);
               _loc9_.text = gls("<body>Требуется <span class = \'level\'>{0}</span> уровень клана</body>",§_-su§.§_-82P§(_loc3_));
               _loc9_.mouseEnabled = false;
               _loc9_.width = 225;
               _loc9_.wordWrap = true;
               _loc9_.multiline = true;
               this.§_-p2y§.addChild(_loc9_);
               _loc10_ = {};
               _loc11_ = this.§_-b19§.totems.§_-51c§(_loc3_);
               if(_loc11_)
               {
                  _loc10_["state"] = §_-ah§;
                  _loc12_ = new §_-u1G§(205);
                  _loc12_.x = 100;
                  _loc12_.y = _loc2_ * §_-H2K§ + 68;
                  _loc12_.visible = false;
                  _loc12_.visible = true;
                  _loc12_.setExperience(_loc11_["level"],_loc11_["exp"],_loc11_["max_exp"]);
                  _loc10_["statusTotem"] = new §_-02M§(_loc12_,§_-su§.§_-P1j§(_loc3_),_loc3_,_loc11_["level"],_loc11_["exp"],_loc11_["max_exp"]);
                  this.§_-p2y§.addChild(_loc12_);
                  _loc10_["totemProgress"] = _loc12_;
                  _loc6_.text = "<body>" + §_-su§.§_-ya§(_loc3_,_loc11_["bonus"]) + "</body>";
                  if(this.§_-b19§.§_-Af§.§_-HT§(_loc3_) != §_-su§.NONE)
                  {
                     _loc10_["state"] = §_-t22§;
                  }
               }
               if(§_-su§.§_-82P§(_loc3_) > this.§_-b19§.level)
               {
                  _loc10_["state"] = §_-F1C§;
               }
               if(!("state" in _loc10_))
               {
                  _loc10_["state"] = §_-k2M§;
               }
               if(_loc10_["state"] == §_-t22§)
               {
                  _loc4_.mouseEnabled = false;
                  _loc4_.mouseChildren = false;
               }
               _loc10_["icon"] = _loc7_;
               _loc10_["itemBackground"] = _loc4_;
               _loc10_["availableItem"] = _loc8_;
               _loc10_["tipField"] = _loc9_;
               this.§_-DD§.push(_loc10_);
               this.§_-U2W§(_loc3_,_loc2_);
               _loc2_++;
            }
            _loc3_++;
         }
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.setSize(350,341);
         this.§_-W18§.source = _loc1_;
         this.§_-W18§.x = 276;
         this.§_-W18§.y = 25;
         addChild(this.§_-W18§);
         place();
         this.width = 650;
         this.height = 420;
      }
      
      public function §_-m19§() : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:§_-u1G§ = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < §_-su§.§_-B3a§())
         {
            if(_loc2_ != §_-su§.§_-y3§)
            {
               _loc3_ = this.§_-b19§.totems.§_-51c§(_loc2_);
               _loc4_ = §_-k2M§;
               if(_loc3_)
               {
                  if(!("totemProgress" in this.§_-DD§[_loc2_]))
                  {
                     _loc5_ = new §_-u1G§(205);
                     _loc5_.x = 100;
                     _loc5_.y = _loc1_ * §_-H2K§ + 68;
                     _loc5_.visible = false;
                     _loc5_.visible = true;
                     _loc5_.setExperience(_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     if("statusTotem" in this.§_-DD§[_loc2_])
                     {
                        this.§_-DD§[_loc2_]["statusTotem"].remove();
                     }
                     this.§_-DD§[_loc2_]["statusTotem"] = new §_-02M§(_loc5_,§_-su§.§_-P1j§(_loc2_),_loc2_,_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     this.§_-p2y§.addChild(_loc5_);
                     this.§_-DD§[_loc2_]["totemProgress"] = _loc5_;
                  }
                  else
                  {
                     this.§_-DD§[_loc2_]["totemProgress"].setExperience(_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                     if("statusTotem" in this.§_-DD§[_loc2_])
                     {
                        this.§_-DD§[_loc2_]["statusTotem"].remove();
                     }
                     this.§_-DD§[_loc2_]["statusTotem"] = new §_-02M§(this.§_-DD§[_loc2_]["totemProgress"],§_-su§.§_-P1j§(_loc2_),_loc2_,_loc3_["level"],_loc3_["exp"],_loc3_["max_exp"]);
                  }
                  _loc4_ = this.§_-b19§.§_-Af§.§_-HT§(_loc2_) != §_-su§.NONE ? §_-t22§ : §_-ah§;
               }
               if(§_-su§.§_-82P§(_loc2_) > this.§_-b19§.level)
               {
                  _loc4_ = §_-F1C§;
               }
               if(this.§_-DD§[_loc2_]["state"] != _loc4_)
               {
                  this.§_-DD§[_loc2_]["state"] = _loc4_;
                  this.§_-U2W§(_loc2_,_loc1_);
               }
               _loc1_++;
            }
            _loc2_++;
         }
      }
      
      private function §_-U2W§(param1:int, param2:int) : void
      {
         if(this.§_-DD§[param1] == null)
         {
            return;
         }
         if(Boolean(this.§_-DD§[param1]["icon"]) && this.§_-p2y§.contains(this.§_-DD§[param1]["icon"]))
         {
            this.§_-p2y§.removeChild(this.§_-DD§[param1]["icon"]);
         }
         switch(this.§_-DD§[param1]["state"])
         {
            case §_-F1C§:
               this.§_-DD§[param1]["icon"] = new TotemItemCircleBlock();
               this.§_-DD§[param1]["icon"].x = 35;
               this.§_-DD§[param1]["icon"].y = param2 * §_-H2K§ + 13;
               this.§_-DD§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-DD§[param1]["itemBackground"].mouseChildren = false;
               this.§_-DD§[param1]["tipField"].visible = true;
               this.§_-DD§[param1]["availableItem"].visible = false;
               break;
            case §_-k2M§:
               this.§_-DD§[param1]["icon"] = new TotemItemCircleImage();
               this.§_-DD§[param1]["icon"].x = 35;
               this.§_-DD§[param1]["icon"].y = param2 * §_-H2K§ + 13;
               this.§_-DD§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-DD§[param1]["itemBackground"].mouseChildren = false;
               this.§_-DD§[param1]["tipField"].visible = false;
               if(this.§_-DD§[param1]["availableItem"])
               {
                  this.§_-DD§[param1]["availableItem"].visible = false;
               }
               break;
            case §_-ah§:
               this.§_-DD§[param1]["itemBackground"].mouseEnabled = this.§_-I1B§ || this.id == §_-su§.NONE;
               this.§_-DD§[param1]["itemBackground"].mouseChildren = this.§_-I1B§ || this.id == §_-su§.NONE;
               this.§_-DD§[param1]["availableItem"].x = 47;
               this.§_-DD§[param1]["availableItem"].y = param2 * §_-H2K§ + 21;
               this.§_-DD§[param1]["availableItem"].visible = true;
               this.§_-DD§[param1]["icon"] = new TotemItemCircleImage();
               this.§_-DD§[param1]["icon"].x = 35;
               this.§_-DD§[param1]["icon"].y = param2 * §_-H2K§ + 13;
               this.§_-DD§[param1]["tipField"].visible = false;
               break;
            case §_-t22§:
               this.§_-DD§[param1]["itemBackground"].mouseEnabled = false;
               this.§_-DD§[param1]["itemBackground"].mouseChildren = false;
               this.§_-DD§[param1]["availableItem"].x = 47;
               this.§_-DD§[param1]["availableItem"].y = param2 * §_-H2K§ + 21;
               this.§_-DD§[param1]["availableItem"].visible = true;
               this.§_-DD§[param1]["icon"] = new SelectTotemItemCircle();
               this.§_-DD§[param1]["icon"].x = 31;
               this.§_-DD§[param1]["icon"].y = param2 * §_-H2K§ + 10;
               this.§_-DD§[param1]["tipField"].visible = false;
         }
         this.§_-DD§[param1]["icon"].mouseEnabled = false;
         this.§_-DD§[param1]["icon"].mouseChildren = false;
         this.§_-p2y§.addChild(this.§_-DD§[param1]["icon"]);
         if(this.§_-DD§[param1]["availableItem"])
         {
            (this.§_-DD§[param1]["availableItem"] as Sprite).mouseEnabled = false;
            (this.§_-DD§[param1]["availableItem"] as Sprite).mouseChildren = false;
            this.§_-p2y§.addChild(this.§_-DD§[param1]["availableItem"]);
         }
      }
      
      private function §_-mV§(param1:int) : void
      {
         this.id = param1;
         if(Boolean(this.§_-uG§) && Boolean(this.§_-uG§.parent))
         {
            this.§_-uG§.parent.removeChild(this.§_-uG§);
         }
         if(this.id != §_-su§.NONE)
         {
            this.§_-uG§ = §_-su§.§_-e14§(this.id);
         }
         else
         {
            this.§_-uG§ = new TotemBuy();
         }
         this.§_-uG§.x = 80;
         this.§_-uG§.y = 60;
         (this.§_-uG§ as Sprite).mouseEnabled = false;
         (this.§_-uG§ as Sprite).mouseChildren = false;
         this.§_-uG§.scaleX = this.§_-uG§.scaleY = 1.1;
         addChild(this.§_-uG§);
         if(this.§_-I1B§ || !this.§_-DD§)
         {
            return;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < §_-su§.§_-B3a§())
         {
            if(_loc3_ != §_-su§.§_-y3§)
            {
               this.§_-U2W§(_loc3_,_loc2_);
               _loc2_++;
            }
            _loc3_++;
         }
      }
      
      private function §_-N5§(param1:MouseEvent) : void
      {
         if(this.§_-DD§[param1.target.name]["state"] == §_-t22§)
         {
            return;
         }
         this.§_-mV§(param1.target.name);
         Connection.§_-e2T§(§_-u1O§.§_-C3N§,this.§_-l1t§,param1.target.name);
         if(this.§_-I1B§)
         {
            return;
         }
         hide();
         this.§_-I1M§ = true;
      }
   }
}

