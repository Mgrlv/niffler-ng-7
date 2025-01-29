package guru.qa.niffler.page;

import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.SelenideElement;

import static com.codeborne.selenide.Condition.text;
import static com.codeborne.selenide.Condition.visible;
import static com.codeborne.selenide.Selenide.$;
import static com.codeborne.selenide.Selenide.$$;

public class ProfilePage {
    private final SelenideElement showArchivedSwitcher = $(".MuiSwitch-input");
    private final ElementsCollection categories = $$(".MuiGrid-item .MuiChip-label");

    public ProfilePage clickShowArchivedSwitcher() {
        showArchivedSwitcher.click();
        return this;
    }

    public ProfilePage checkCategoryIsDisplayed(String category) {
        categories.find(text(category)).shouldBe(visible);
        return this;
    }

    public ProfilePage checkCategoryIsNotDisplayed(String category) {
        categories.find(text(category)).shouldNotBe(visible);
        return this;
    }
}
